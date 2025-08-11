local Recursao = {}

function Recursao.fatorial(n)
    if n == 0 or n == 1 then
        return 1
    else
        return n * Recursao.fatorial(n - 1)
    end
end

function Recursao.somatorio(n)
    if n == 0 then
        return 0
    else
        return n + Recursao.somatorio(n - 1)
    end
end

function Recursao.fibonacci(n)
    if n == 0 then
        return 0
    elseif n == 1 then
        return 1
    else
        return Recursao.fibonacci(n - 1) + Recursao.fibonacci(n - 2)
    end
end

function Recursao.somatorio_entre(k, j)
    if k == j then
        return k
    else
        return k + Recursao.somatorio_entre(k + 1, j)
    end
end

function Recursao.isPal(s)
    if #s <= 1 then
        return true
    else
        return s:sub(1, 1) == s:sub(-1) and Recursao.isPal(s:sub(2, -2))
    end
end

function Recursao.convBase2(n)
    if n == 0 then
        return "0"
    elseif n == 1 then
        return "1"
    else
        return Recursao.convBase2(math.floor(n / 2)) .. tostring(n % 2)
    end
end

function Recursao.somatorio_lista(lista, index)
    index = index or 1
    if index > #lista then
        return 0
    else
        return lista[index] + Recursao.somatorio_lista(lista, index + 1)
    end
end

function Recursao.findBiggest(lista, index)
    index = index or 1
    if index > #lista then
        return nil
    elseif index == #lista then
        return lista[index]
    else
        local maior_resto = Recursao.findBiggest(lista, index + 1)
        return math.max(lista[index], maior_resto)
    end
end

function Recursao.findSubStr(str, match)
    if #match == 0 then
        return true
    elseif #str < #match then
        return false
    else
        local starts_with = str:sub(1, #match) == match
        if starts_with then
            return true
        else
            return Recursao.findSubStr(str:sub(2), match)
        end
    end
end

function Recursao.nroDigit(n)
    if n == 0 then
        return 1
    else
        return 1 + Recursao.nroDigit(math.floor(n / 10))
    end
end

function Recursao.permutations(s)
    if #s <= 1 then
        return {s}
    else
        local result = {}
        for i = 1, #s do
            local char = s:sub(i, i)
            local rest = s:sub(1, i-1) .. s:sub(i+1)
            local perms = Recursao.permutations(rest)
            for _, perm in ipairs(perms) do
                table.insert(result, char .. perm)
            end
        end
        return result
    end
end

return Recursao

