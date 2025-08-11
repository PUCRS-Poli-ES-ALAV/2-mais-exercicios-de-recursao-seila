local Recursao = {}

-- Modelagem: fatorial(n) = n * fatorial(n-1) se n > 1, senão 1
function Recursao.fatorial(n)
    if n == 0 or n == 1 then
        return 1
    else
        return n * Recursao.fatorial(n - 1)
    end
end

-- Modelagem: somatorio(n) = n + somatorio(n-1) se n > 0, senão 0
function Recursao.somatorio(n)
    if n == 0 then
        return 0
    else
        return n + Recursao.somatorio(n - 1)
    end
end

-- Modelagem: fibonacci(n) = fibonacci(n-1) + fibonacci(n-2) se n > 1, senão n
function Recursao.fibonacci(n)
    if n == 0 then
        return 0
    elseif n == 1 then
        return 1
    else
        return Recursao.fibonacci(n - 1) + Recursao.fibonacci(n - 2)
    end
end

-- Modelagem: somatorio_entre(k,j) = k + somatorio_entre(k+1,j) se k < j, senão k
function Recursao.somatorio_entre(k, j)
    if k == j then
        return k
    else
        return k + Recursao.somatorio_entre(k + 1, j)
    end
end

-- Modelagem: isPal(s) = true se |s| <= 1, senão s[0] == s[-1] && isPal(s[1:-1])
function Recursao.isPal(s)
    if #s <= 1 then
        return true
    else
        return s:sub(1, 1) == s:sub(-1) and Recursao.isPal(s:sub(2, -2))
    end
end

-- Modelagem: convBase2(n) = convBase2(n/2) + (n%2) se n > 1, senão n
function Recursao.convBase2(n)
    if n == 0 then
        return "0"
    elseif n == 1 then
        return "1"
    else
        return Recursao.convBase2(math.floor(n / 2)) .. tostring(n % 2)
    end
end

-- Modelagem: somatorio_lista(lista, i) = lista[i] + somatorio_lista(lista, i+1) se i <= |lista|, senão 0
function Recursao.somatorio_lista(lista, index)
    index = index or 1
    if index > #lista then
        return 0
    else
        return lista[index] + Recursao.somatorio_lista(lista, index + 1)
    end
end

-- Modelagem: findBiggest(lista, i) = max(lista[i], findBiggest(lista, i+1)) se i < |lista|, senão lista[i]
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

-- Modelagem: findSubStr(str, match) = true se str começa com match, senão findSubStr(str[1:], match)
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

-- Modelagem: nroDigit(n) = 1 + nroDigit(n/10) se n > 0, senão 1
function Recursao.nroDigit(n)
    if n == 0 then
        return 1
    else
        return 1 + Recursao.nroDigit(math.floor(n / 10))
    end
end

-- Modelagem: permutations(s) = [s[0] + p | p ∈ permutations(s[1:])] ∪ [s[i] + p | p ∈ permutations(s[:i] + s[i+1:])]
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

