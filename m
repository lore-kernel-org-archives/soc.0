Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D5E1A5BBC
	for <soc@lists.linux.dev>; Fri, 29 Aug 2025 05:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756447145; cv=none; b=ZzKGvNKlipYVFyYSLTUHyzzmEpFgm0BjLx6IuO4z6Cmwmw/mN6CRqeAqZkGCCzCVW64td1ghldO/KJWzIQlEuq1popsmiHMDs793hJmMJYjqin42qhF7dui0YovpEzGTPmxpflAfnSvZRQ3zrlpCjA2lYh3Jn0Ow+j1VoYGkbcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756447145; c=relaxed/simple;
	bh=kCfQ8ISGxKI+1ym5WMCNEewc5989yFoQC7vkJ/V7emA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=apa21pTUXvW1WO62YETe/DvlXqRw7K/AlOeqP0SWFe3LK9EEdr3ba3X1iWetLNungMj2hjymfPG2rUXZT18Gin0yex6k7/iutDJdNvjuA8y9bYxqH3rxagwtYpR/8qtsylOtReY6aHRKHAdZ9mHqw1P5NzFwdbl0S58xsXj17BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GuCRrQqP; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GuCRrQqP"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afe80ff97adso28634166b.2
        for <soc@lists.linux.dev>; Thu, 28 Aug 2025 22:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756447142; x=1757051942; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a8nLSUsm88QMj2KXiJKv/xrkbZBm4Zb7nYR0CSmM3jI=;
        b=GuCRrQqPcQdhVLWBx+MK2LhPC71/fWSvkB7JHvHpfsH8b1cogukScb1mSo5Vx8YDc1
         vmtIM+RAshNXe/OL7i6eaH/G+nnBfT6rABXcJpk37vcJmBB++I/bwrJkj/AsIHQGUAFe
         cLrCOAlM0jgCiysWIIDvpknnQ94T49OdrcYVtdlyJaGJzi4kYrr+vme87+Go7VoVhlyu
         0ILKJH5i74Wn03iAfjR9sgJLnIpBxlV6kx4FTOVq5IU9+HeSpYe+33FPPC4i7QBfLCv/
         ZnGvgUWzLdjvGNyghnrYzIe0CpzZ7hPztYOd5zFoIkYy6PnQ5R/i7I9gM/HWHDDQ0uPo
         fBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756447142; x=1757051942;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8nLSUsm88QMj2KXiJKv/xrkbZBm4Zb7nYR0CSmM3jI=;
        b=RU5gkK0dRsuCJ9iYGS/UJnUqHMNSarDWAt5n7bp0szG6M+7ojoTeUK6Pe59D31jMU/
         S4b21UHjGpCHFiua0iRiwq843GnRAJ4cJXfFaLEHrM+bew+1K1URO+kEe34G+3tIBkAM
         hWk62NOHnoH9lf1GDv9jyQ0mUjNh7f8OTdYXpPvl0omjkdZOhS62pfY5igT3hIOzXLQc
         ulGJAWhaY21wmgMqSL76pxvzRjumB5oSzXcWLakNnOtyNcRmJSNISRhfTecAyw0pKQbg
         GBiJ9z1DgWGJ2PgDyKXshZCQcCuqbNZS6dCG2BmDftSusyJSNzZsTrM0xk1sVgGEP7x/
         FLnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDmyjuVi6NVkKVt3R8y/SE5D6f9w26n1EZnSvp4zvSpkVDP5oBLyKi0KiwJKzjN2GmXgU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzn+8fD1OcyrGgL5O4c1qkMr3w4RzJlagSmFzY1bQbiuwANntwr
	HcPQBuNwyGNGTiNajlvto28Pw4KejziiSvplDsyhs8pcHRAu3QoIvQR7pUOQT7Wxuv8=
X-Gm-Gg: ASbGncvUm4CwHsHKlGSpIQm5leQW4qJXidfSU+9DQwjFuOlWKhM9KSuP7z9tPCpgU4S
	yoVGVtsPF1L2WFvTqpeKHjpr3hcLPToVc7wxxUSfbpGDCudqTCccdSU5Jr9NSYz6VKYm+0/b+OL
	dMEoix45/4XjbIZ6xtLsGhOLDzVwrrNabAVIlbzQdliLDV0p+HqSg71bVIA8LZ9RDlu9yJuY/Zi
	O6YgkZ9nWbQ5Cb0XV3OQgtgEWZzEri/T2gziBBrjv2dGLbbTmzUIYsJAuNTy6mD8MuWsNk0YQ8o
	8z8ttqMSE95N6x5JNuda1lBjSzAFDPZKsJDwNBU6XtnkcZIaVI8kD5M979VBW7rr99JzeKEJHNq
	ULDFWqoTy5za5xum33sSp3nZzPSQQR8U09FJYKQyq0IRJeOlJ1uaxXg==
X-Google-Smtp-Source: AGHT+IFJoBS+3mvK22Fgj6iGPN4/Io1Wtp2BF5CgdO2geYPYBqSJlkS1FUSI5IVAmVO8bCseZE6bPw==
X-Received: by 2002:a17:907:3c95:b0:afe:ee31:4b93 with SMTP id a640c23a62f3a-aff0e28a1demr8112766b.0.1756447142009;
        Thu, 28 Aug 2025 22:59:02 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff00a5e96esm99362866b.88.2025.08.28.22.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 22:59:01 -0700 (PDT)
Message-ID: <4e51bbdc-744b-4a23-a695-a6c49d82e779@linaro.org>
Date: Fri, 29 Aug 2025 07:58:59 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: axiado: Add missing UART aliases
To: Harshit Shah <hshah@axiado.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev,
 soc@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250828-axiado-ax3000-missing-serial-alias-v3-1-393111f4bd9e@axiado.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+AhsD
 BQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmgXUEoF
 CRaWdJoACgkQG5NDfTtBYpudig/+Inb3Kjx1B7w2IpPKmpCT20QQQstx14Wi+rh2FcnV6+/9
 tyHtYwdirraBGGerrNY1c14MX0Tsmzqu9NyZ43heQB2uJuQb35rmI4dn1G+ZH0BD7cwR+M9m
 lSV9YlF7z3Ycz2zHjxL1QXBVvwJRyE0sCIoe+0O9AW9Xj8L/dmvmRfDdtRhYVGyU7fze+lsH
 1pXaq9fdef8QsAETCg5q0zxD+VS+OoZFx4ZtFqvzmhCs0eFvM7gNqiyczeVGUciVlO3+1ZUn
 eqQnxTXnqfJHptZTtK05uXGBwxjTHJrlSKnDslhZNkzv4JfTQhmERyx8BPHDkzpuPjfZ5Jp3
 INcYsxgttyeDS4prv+XWlT7DUjIzcKih0tFDoW5/k6OZeFPba5PATHO78rcWFcduN8xB23B4
 WFQAt5jpsP7/ngKQR9drMXfQGcEmqBq+aoVHobwOfEJTErdku05zjFmm1VnD55CzFJvG7Ll9
 OsRfZD/1MKbl0k39NiRuf8IYFOxVCKrMSgnqED1eacLgj3AWnmfPlyB3Xka0FimVu5Q7r1H/
 9CCfHiOjjPsTAjE+Woh+/8Q0IyHzr+2sCe4g9w2tlsMQJhixykXC1KvzqMdUYKuE00CT+wdK
 nXj0hlNnThRfcA9VPYzKlx3W6GLlyB6umd6WBGGKyiOmOcPqUK3GIvnLzfTXR5DOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCaBdQXwUJFpZbKgAKCRAbk0N9O0Fim07TD/92Vcmzn/jaEBcq
 yT48ODfDIQVvg2nIDW+qbHtJ8DOT0d/qVbBTU7oBuo0xuHo+MTBp0pSTWbThLsSN1AuyP8wF
 KChC0JPcwOZZRS0dl3lFgg+c+rdZUHjsa247r+7fvm2zGG1/u+33lBJgnAIH5lSCjhP4VXiG
 q5ngCxGRuBq+0jNCKyAOC/vq2cS/dgdXwmf2aL8G7QVREX7mSl0x+CjWyrpFc1D/9NV/zIWB
 G1NR1fFb+oeOVhRGubYfiS62htUQjGLK7qbTmrd715kH9Noww1U5HH7WQzePt/SvC0RhQXNj
 XKBB+lwwM+XulFigmMF1KybRm7MNoLBrGDa3yGpAkHMkJ7NM4iSMdSxYAr60RtThnhKc2kLI
 zd8GqyBh0nGPIL+1ZVMBDXw1Eu0/Du0rWt1zAKXQYVAfBLCTmkOnPU0fjR7qVT41xdJ6KqQM
 NGQeV+0o9X91X6VBeK6Na3zt5y4eWkve65DRlk1aoeBmhAteioLZlXkqu0pZv+PKIVf+zFKu
 h0At/TN/618e/QVlZPbMeNSp3S3ieMP9Q6y4gw5CfgiDRJ2K9g99m6Rvlx1qwom6QbU06ltb
 vJE2K9oKd9nPp1NrBfBdEhX8oOwdCLJXEq83vdtOEqE42RxfYta4P3by0BHpcwzYbmi/Et7T
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250828-axiado-ax3000-missing-serial-alias-v3-1-393111f4bd9e@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/08/2025 20:27, Harshit Shah wrote:
> Axiado AX3000 EVK has total of 4 UART ports. Add missing alias for uart0,
> uart1, uart2.
> 
> This fixes the probe failures on the remaining UARTs.
> 
> Fixes: 1f7055779001 ("arm64: dts: axiado: Add initial support for AX3000 SoC and eval board")
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Harshit Shah <hshah@axiado.com>
> ---
> - Run "b4 trailes -u"
> - Link to v3: https://lore.kernel.org/r/20250824-axiado-ax3000-missing-serial-alias-v3-1-5db4143bf189@axiado.com

Please don't do this. It just generates unnecessary traffic. See my
instructions you receive on your first submissions.... unless you want
to send patches to soc@ (which looks added here) but then this is also
wrong - we do not send patch by patch. Collect *all* the patches for the
next merge window and send them around rc5 (rc6 being the latest).

Best regards,
Krzysztof
