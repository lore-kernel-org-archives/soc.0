Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6667233F598
	for <soc@lists.linux.dev>; Mon, 13 Jul 2026 02:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783911466; cv=none; b=Sa2LUTPnVYDtsfp57aCSiiRj85kmcwuNQGdbWLWMTwJC1OZ8uxEJ3upc1OJfBA8WWlS/CeOETWaNku+t+29/UwAsNq4RYyk4QIsTjAxWSqDQPo4T/gMYG+fpQCnoMUYcaBK3TIPzGvm3Xw8+QShqPYvzWJAEgWDwvwgTW8871mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783911466; c=relaxed/simple;
	bh=1t/sTm1l2pvzCHyeOfL172JqiIlHB4cJXkjujZxHMi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxLEy9mD/5MiaUJJapTAc/qymTh27qqlEzlTz3HNz+sUHSEz3oMu7igHLybCrq+4rTcu7ufEVnSy/dOmyDGih8XqNaRkYaHbR0TWqUkMDjEPMUt4F8UUERpYgtLEYOGvtCCYGCJMXlO3k/zcvgD+e/P5B91JawMigWzaN5mjB3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p+eD3KlU; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p+eD3KlU"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so1524671a12.1
        for <soc@lists.linux.dev>; Sun, 12 Jul 2026 19:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783911465; x=1784516265; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M6MgoXC4jIcUDKauhvWR6PqJ71dM5+J5YjsOoEDTJlo=;
        b=p+eD3KlUy7TtTH5wb6nAdxM3Rnj0qvmRothqbKedP4moaDdoIRHVSx8IB3EBilgbr+
         bN519iVJYKwLKiMqi+JMbDnffDYvzlO3CimTfiC6tvFMoy9fCrhLGKBN4PH+IhRTYDln
         /EOtlqoVhXeZLAGi6Rn+wuFRPEveN73uk5KnLemZRzYxvVZYCAhJgIiKfiGKIiYm7E26
         jOuHHzz4YZ5W2dH3IWS9gB+qUwEncKw+KUKmSbqX20abH2dx+0y2Qf/lofS6xXKb/ExG
         0tkdasOQHw2BovXhBVb1WW6aFsnl0FH5MzWS/doX/cQM8ZpR5/PwXD6T+WU5twgFOtMs
         WMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783911465; x=1784516265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M6MgoXC4jIcUDKauhvWR6PqJ71dM5+J5YjsOoEDTJlo=;
        b=S1U6pqVQqHYKHgsEqBpIKqltOHuBXXaHUlMyZ92McTtkjiQzas7E7a0qSrsICp5biN
         rUr3CDKSIftvIATn7l+ghtocPNOoMEn+BnTITaIiw/m3ADY2rDIWR7msgDjHrbTXxoL5
         rzlseP2nDCYIisWGa46wVjuNPYhxs6HVA6v1o7TuEwHb3lybIFVl+AciUv/Tm2H63PO3
         h+gmxBsgo/OuZRn1czzNboEtZmDBADpjo3e7R9M+46TLBe3jEf+x42WDUTJa1Jz80T7a
         LiyW2cJvHGW+wPQFdwasvTfEulA+z5q6595cnh4CCbHjttbeklZWaNP9UfyFV3UxKND0
         4EAw==
X-Gm-Message-State: AOJu0YzP5GX9D3zxmj0FwpJiAiFRt/smqg/6GnmzaR/WUDj08A1w+2d2
	xLDfs8FPvdu/zjCpje6RK7Cqus5KMO9E+QFVIsYqToR6fXZRQ3z6PkGUrpA/OA==
X-Gm-Gg: AfdE7cm4zCFB6eDbqlDAyAAlx5+gNAAoypaEf3RM4KJJxLLNROSSEAm45xQXZ4Hsb2I
	U74Rw+gWDLUmOHJ7+2p9V6ov52a8IRpcwZoVf0AiqjzKDazfgWHPYrEJW3pSNkQjTRXEl3Ly/a1
	HIsbHgcbGwTbsQYN/PclUlEksPkpt488Cn940J2Ri2JGX/DtadG4/BkoBYxVzDYjO1iqeLmxXxK
	VWAzH9UuHW9/ujhPrU+l+GBXZJFlnv+QKhSUaLhl11za2jX79Lmcgbtzat+0QYIhGY749xsMFHI
	JuV6tvTV2m3hf0oXLTkzi9c+8qTB6Q9yZlYu4lFy8CBJudfmm+gzQ+u8Dx/iCQocgB1tpQxBKmY
	OztPjEfpa35tYsQUDfhc8ZlfNxykpyfWqBSgDlw0a4mNW0cjBCbj+/NA4meis9rqZ198onQqwcP
	B3k0ZwT8CoMvodDRJTqaasSWvLLYKj4vOW353iXUp98hsdUfBZ7FPleEL52ZxgGqJ1FGdCVw==
X-Received: by 2002:a05:6a00:909f:b0:848:2f74:d8cf with SMTP id d2e1a72fcca58-84889833b4amr7034427b3a.64.1783911464761;
        Sun, 12 Jul 2026 19:57:44 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6ddc974sm13503512b3a.60.2026.07.12.19.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 19:57:44 -0700 (PDT)
Message-ID: <825a3a1b-8891-4172-afd6-8de6077fa129@gmail.com>
Date: Mon, 13 Jul 2026 10:57:39 +0800
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND] arm64: dts: nuvoton: ma35d1: add CAN nodes
To: Arnd Bergmann <arnd@arndb.de>, Zi-Yu Chen <zychennvt@gmail.com>
Cc: soc@lists.linux.dev, Jacky Huang <ychuang3@nuvoton.com>,
 schung@nuvoton.com, Rob Herring <robh@kernel.org>, krzk+dt@kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20260708082457.460710-1-zychennvt@gmail.com>
 <5f2954e4-2e0c-40d0-b67f-933446c83cc1@app.fastmail.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <5f2954e4-2e0c-40d0-b67f-933446c83cc1@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

Thanks for the clarification.

Shan-Chun and I are still maintaining the MA35 platform.

I have reviewed this patch and it looks good to me.

Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>

We agree that the current maintenance path for MA35 could be clearer.
We will work on making the MA35 maintenance flow more transparent.

Thanks for pointing this out.

Thanks,
Jacky


> On Wed, Jul 8, 2026, at 10:24, Zi-Yu Chen wrote:
>> Add controller nodes for the four Bosch M_CAN blocks found on the
>> Nuvoton MA35D1 SoC.
>>
>> Additionally, configure pinctrl and enable CAN1 and CAN3 on the
>> MA35D1 SOM board. Also, update the APLL frequency to 200MHz to ensure
>> the CAN controllers receive the required input clock for 50MHz operation.
>>
>> Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
>> ---
>> Resend note:
>>   - resend with the complete Cc list; no patch changes
> Hi,
>
> I don't see anything wrong with the patch contents, but I think you still
> have the wrong Cc list. You have sent the patch Cc: soc@lists.linux.dev,
> which is where maintainers should send the patch when it is ready for
> inclusion in the SoC tree, and you have sent it To Olof and me.
> Olof retired as SoC tree maintainer a while ago, and I'm not going to
> apply this because it should go through the Nuvoton tree maintained
> by Jacky Huang and Shan-Chun Hung.
>
> Please send future patches to the maintainers that are in charge of
> applying the patches, without adding soc@lists.linux.dev yourself.
> The maintainers will then forward it when they are happy with the
> changes.
>
> I just noticed that we have two conflicting maintainers entries
> for ma35:
>
>   - Jacky and Shan-Chun are listed for the ma35 SoC, but have
>     not sent any updates after the initial merge in 2024 and
>     don't currently have a git tree in linux-next
>
>   - Andrew Jeffery and his team are listed for npcm with
>     arch/arm64/boot/dts/nuvoton/ listed as one of the file
>     locations, though that contains both ma35 and npcm.
>     Andrew has the bmc tree in linux-next and has recently
>     picked up patches for both npcm and ma35.
>
> I see there is a lot of activity at the moment working on
> ma35 drivers, so it would be good if the maintainers could
> figure this out together and provide better guidance to
> individual developers. I don't mind pulling from one
> team or the other, but I would definitely prefer the MAINTAINERS
> file to reflect the actual state here.
>
> If Jacky and Shan-Chun are planning to do the merges going
> forward, they should add their git tree to linux-next and
> update the MAINTAINERS file to list the git URL.
>
>        Arnd



