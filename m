Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF8727057D
	for <soc@lists.linux.dev>; Tue,  8 Sep 2026 01:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788832077; cv=none; b=clK2iPMJfzpKjYzHXpM0/6JdmQQVdKqLpxX6e5OrWfctqL3hZGdoeDtGM9NEx+0xycs3yOzwBhQi/eEgnIzymu0Cos6hto0e+CH7+ECLb/V6+mjobo3RFKwZldVXUiQqa1cpJO6oQdJmG17AQO7BX9zCh/pdynlYL+5iHHhO4YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788832077; c=relaxed/simple;
	bh=6zo3xALxxS+irk1kCXvT6aZvvEKHcRwbGKP/kCF+mCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eXJts7iWBr1EowSnWEsZlKYwMiY0zAKP4uMo3MQibai9gCE1QzUpdbKVVk5u77EBw9eqGE8c/1vWgW+LmvdKYkihnkW+ViLlSMBwye1gbSDTN6n0QsrWdfLd9SEt2kz80XhO9XyHLpAijzI3Dz76ZTH5xCNuKPi5i+3gAWHjU8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f4kl7ndX; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4kl7ndX"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38759bcd877so4172663a91.2
        for <soc@lists.linux.dev>; Mon, 07 Sep 2026 18:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788832076; x=1789436876; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+D8OGQX5ee8v+2YrsPvbA+E8GJJ+MSfRQUQGJHg5BhA=;
        b=f4kl7ndXaQSymnqZAKxoium9ckHNUDiUwH4ZjfLsj9La6IC/TH44p0MZFc4AcB9u9n
         S9H6QbHK5I+ioZTUhH9kODh1kVjQ144/xTpEXaGAquNIO/26l/eb6Ywl3UEz563ZYN6N
         p+1MKM621W0hN6I/MG386ElebYZ7gIrn9avxVrbyr2HYxYQ3lcSwRoJfSUA3dUMgtZcF
         kAqer+JshinF6VBV867p8466xcnJLVHuCYH8di60xZCbDrZ6JDKyFUBssYx7PfILSTw8
         iyJVMoYMUACJ6Pd5vUgcwEDjBIrxyT3ZGUnp253LzdydqgREKjzBHzOtJY0hgBbhxUZV
         243A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788832076; x=1789436876;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+D8OGQX5ee8v+2YrsPvbA+E8GJJ+MSfRQUQGJHg5BhA=;
        b=kOj2ywR8mXwRvN4ZQBeUFKIDI9ZU8LiHj01CG96uklSb4T2OlRPvj7l77N5I66eYMG
         /SBN5gZqQGmlojoVoq3xyigH45XlC7GxbTfxlXhYfOU20fb+clx8yrJtL56t6+/mb0jp
         12ictjC0UAnoUEbHrDCI2lNg9v+Y+FYAtZJgqX/E0lG+X0373PAyxj6KnPvhuV7w2JXo
         Csu6DiqAHb8V3Bqf6AVkguYxmwgffz3REeiK2D2jZAxBebiMuurswti+tgO1CvLkqeXN
         HWF/QB81H9HirmsZ4XUJ7xzb29h5jNOR2fmzTShqYpr1jZlL7LssXimvXl+VTznjdXIN
         faXg==
X-Forwarded-Encrypted: i=1; AKwUvBySwN4MyCYbS7gqSqegsdCc9BFdgIlQbEuBVCaheAw8iaGClBOilQxP5ldgjj1lCWrsbQ0=@lists.linux.dev
X-Gm-Message-State: AFuF++n2Q+zIJrcC4EfpedcW6JAvjNm6K4JSj5P9HsYZ+sXjVW3pKN7k
	jbaLhpu6g26+gDQgpmoDmB8jq2DZ5d9r7wHJsj0GXkFiIISUQdmXJqC5
X-Gm-Gg: AYBFou0rR6XsxGT1fLVx69PLeuAzwRH/1tImnm9+On+1LIJc4ivYyKsNQjIoZyzNFaA
	/I/oRUpe2Rp67LFDis1CaSE1ZzeZUiJ/EhY8jXjmTEJ7W7yftZywz2ENxHYdJJFs6UoY0ZV1wCX
	KGtgpNxeQDTLeyQIhHJp01ydPgVbxmtqrN5V+Mex8OVEX5r7ZGnakfD7cONNUw8HcTve5vKbDJH
	5Xr6CQvMYIxHKLQ2VXeSelF1WygE/Ghfqh7oqwXTFPkULgONWFHZD9qAFrdeTT6kfpbqhoNOol9
	Aez+3u7uLLlmKCKrDt3HS4uzQKzxAUfSt/566YTQFMzYUNnTW7pdlsdebH17wHtLc6nbR0zJPlQ
	XGu85ydo2PBCLnShb167tqIWE7PJ6vNm0+TDHsQ11dFDNnvd2X+O5loeghK0rtNx2cKXBZmHhk0
	s0Pz2EFqT//jenVrQCAxEFrLMGGX1x3f8ejAhC449t9Mb1C0g6OcM9+/vjyZoumlFmjAVCFVd+S
	ZAIQ/VEivxHL+ngsR659q8BooMSgzfyfhQv
X-Received: by 2002:a17:90b:534e:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39b2624f0f4mr37945657a91.23.1788832075923;
        Mon, 07 Sep 2026 18:47:55 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26123c99sm23052621a91.11.2026.09.07.18.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 18:47:55 -0700 (PDT)
Message-ID: <3dde0b18-ba6e-466d-94f5-e5ca3ee083e8@gmail.com>
Date: Tue, 8 Sep 2026 09:47:51 +0800
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND] arm64: dts: nuvoton: ma35d1: add CAN nodes
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: arnd@arndb.de, olof@lixom.net, soc@lists.linux.dev, ychuang3@nuvoton.com,
 schung@nuvoton.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260708082457.460710-1-zychennvt@gmail.com>
 <20260824-smooth-jolly-sponge-ba4b95-mkl@pengutronix.de>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <20260824-smooth-jolly-sponge-ba4b95-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks for the review.

I tested the change and confirmed that an accurate 80 MHz CAN clock can be generated.
I've uploaded v3 with this change included.

regards,
Zi-Yu

Marc Kleine-Budde 於 2026/8/24 下午 06:39 寫道:
> On 08.07.2026 16:24:57, Zi-Yu Chen wrote:
>> Add controller nodes for the four Bosch M_CAN blocks found on the
>> Nuvoton MA35D1 SoC.
>>
>> Additionally, configure pinctrl and enable CAN1 and CAN3 on the
>> MA35D1 SOM board. Also, update the APLL frequency to 200MHz to ensure
>> the CAN controllers receive the required input clock for 50MHz operation.
> 
> 50 MHz is an unusual CAN clock frequency. Better use a multiple of 40
> MHz. Within the limits of the m_can IP core, the higher the multiple the
> better.
> 
> regards,
> Marc
> 

