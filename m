Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14AA3E3D8E
	for <soc@lists.linux.dev>; Wed, 18 Mar 2026 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773847690; cv=none; b=Hahtr2691yAYzHfvP3XOH95ppTWwLEFVC0aH4VPKXfz/nr8SsqwOz+gol4TItyvLuf3w/S7Pbns/Yc+DyMv6yuuL7OV4CH5VA96AWUryd2VAKYHal7Hd6Bbjyt07LoUovPOPLOP9xUOwCAS+lXHDUfezGhlXmpoq+7MDarpfp1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773847690; c=relaxed/simple;
	bh=uG0xA9OgWMbOrXG76ij9Rc/ULoVuEqw816BAx3ffL7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ek5UEh0pOsajJrK/Gf+lA2HyQdZktRDUOqe4bez7Eu6CZrB0A1DL+4tHV1K4aGYYtY1U8aLeiug+8/20J9P8Fdmhw8QogYblQMb9L/nCD2GvJwZMofzDeoQipUAFD4aqb9uj1hoQ2Hb7QzQ3yLgeYvkcOQRS1WuKiz8+9in1xoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UU2sPWt4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UU2sPWt4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so78643565e9.3
        for <soc@lists.linux.dev>; Wed, 18 Mar 2026 08:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773847681; x=1774452481; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W3OxEB2yN+2GerMbkLU+TUfu7OMQbU8BdF0KGaxmiRU=;
        b=UU2sPWt4Js13WiaJIMYr1LUFoe5oeq+WrQMJ+u2fQLPsrcGOPmkngJswj0wfJuheHq
         GbG1OEelI3pnfQWRD/tou0YlqF9ZOqXHZfMh2KrkSE8ss41KBSEp6ZU7RnFKmDA+FitF
         9268K3KjbXUqVk/JDltwFDUxDtINib+FRjpLXiWRfkcuZvZ+i3pgtMyRoU7Uv0IhSenI
         h+s3VMe3DaK0XFxnKWwyomHaobjN0Z0z8slauyWHQfKicgjow2sfldFgBKyUzaZbdrwF
         DpPkoR2Abx5TD8mn83woFUnYmAuhSUOArnUjHnIb0OwPK98cxCdnIg8eUcifOQrUCHGO
         HI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847681; x=1774452481;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3OxEB2yN+2GerMbkLU+TUfu7OMQbU8BdF0KGaxmiRU=;
        b=P3qXXjfez+DXomBbYsP/JCI6gL69A03HHpcyRK09ZQjnOCV6bD4B+uii031z1gerZf
         5MwP2OAYjfIz5WHm51wt+fVALKqj8SdZauIbJc8+aL1suvRoCkrDDo2kXWHdA80HJTPV
         lRnErZdYJDi/mxqvjHfRaWU1gNL58HrCeTnfFFjHXpvkFSPczzpbKvY+qNb3ShUCCSVq
         7npSg/d+JH+THxvJwq95BBx7B5LJ452DrpVFmpPc7kmpJ1/ktwmkyb49FX2e//Sx/C0K
         L/k3gdAa4S1xifVDEPjyYdUbqQ59+Zwemoj0QB0+wJbqkyZTD29L2xP8HEm2BAtf6gQ1
         jgIA==
X-Forwarded-Encrypted: i=1; AJvYcCVKIHF+eiNqt/eWRCZ5YuXJ2sRRp4aqCaZ2dyH2+hmW+0I3dQSz/YVBCkj03mdzrhcpqyQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxdjrjM2EaeEbta4nhciga0aDjHee1W1R01sjzHt5vzv5Sgf18p
	dl9s7sMIU3OfMLpeCtu8EcGaVDvWBiR7xB+1UBY0ivsyrpnBFsfPPfkVv7znNji6S5Y=
X-Gm-Gg: ATEYQzz9NHYV8k6mCi4OwSSvCu5XyQlDsL6dKqRJnsy6QyvGatcKbRcD6E7Y4R3Pvdm
	UCVdMT6EIzizZ/1xFer2Kql4nXrRyQvQD/TGd0z3ETiVHjvsKVoXQTaU5tdyPIQcyZAZEilMwkd
	+bXPrL0WAGw+nWqO+RtZACECjw+E1rRTwNwNx4ns1f313LZTpzIvsCxot1N3k53v2U7TiW6R9/8
	KDH0KuOicv59Kf4PiSr4Kr8M9qf9pdI2SOpNslg9dFIMPgdlfjd+cRuSiRaEijmkjPkK+hoqrSJ
	C8rSUQVtV9x5ic9Tmu9ABx8i69yIKYEuMe0+SgtpdpnQbZLJugVVVWeJhUYpjQ2ti58i2ISS8e0
	2F6oLvPtrkX+q9OEYV8tx6E4mUOhtEXGgqVaQN5MSlj6GURhkHt1H2aRKFTg7RohN2ySvrAr5nS
	FrdJVYvwNIqwJIdv09OFIv0DZK+4EjBLgDg39DMP5q073zpSgxu/Gf1L1w0B1wmC9HWWQr1yXBS
	aRvQk8JyeL4vjcGfhmzvCVqkWAkkXbgqRd+KJo6pKfwf4XddO0VlA==
X-Received: by 2002:a05:600c:4585:b0:485:39d4:2dd9 with SMTP id 5b1f17b1804b1-486f45708e5mr67334395e9.33.1773847681338;
        Wed, 18 Mar 2026 08:28:01 -0700 (PDT)
Received: from ?IPV6:2003:c2:c71e:d000:d65d:64ff:fe46:1d1? (p200300c2c71ed000d65d64fffe4601d1.dip0.t-ipconnect.de. [2003:c2:c71e:d000:d65d:64ff:fe46:1d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b0b99dsm664065e9.1.2026.03.18.08.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 08:28:01 -0700 (PDT)
Message-ID: <bbabf0f1-99fa-4822-85c8-df76ce89da01@suse.com>
Date: Wed, 18 Mar 2026 16:27:59 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: realtek: Fix memory node unit-address
 mismatch
To: Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkA==?=
 =?UTF-8?B?5ZCbXQ==?= <eleanor.lin@realtek.com>,
 linux-realtek-soc@lists.infradead.org
Cc: Drew Fustini <fustini@kernel.org>, =?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmP?=
 =?UTF-8?Q?=5D?= <cy.huang@realtek.com>,
 Stanley Chang <stanley_chang@realtek.com>,
 =?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linusw@kernel.org>
References: <20260318114047.2804171-1-eleanor.lin@realtek.com>
 <405a9783-0f77-4ce0-8288-43eaada09cff@kernel.org>
 <e4c0187e-566b-42fb-920c-3cf73ed6cd6a@app.fastmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.com>
Organization: SUSE Software Solutions Germany GmbH
In-Reply-To: <e4c0187e-566b-42fb-920c-3cf73ed6cd6a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18.03.26 15:28, Arnd Bergmann wrote:
> On Wed, Mar 18, 2026, at 12:46, Krzysztof Kozlowski wrote:
>> On 18/03/2026 12:40, Yu-Chun Lin wrote:
>>> The memory node unit-address should match the first address in the reg
>>> property. Correct the unit-address from @40000 to @50000 to align with the
>>> actual base address (0x50000) defined in the reg property.
>>>
>>> Fixes: b095c27fc874 ("arm64: dts: realtek: Add Kent SoC and EVB device trees")
>>> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
>>> ---
>>> This patch series is sent to both Realtek and ARM SoC maintainers.
>>> While Andreas Färber is listed as the Realtek maintainer, there has been
>>> limited activity recently.
>>
>> Unfortunately nothing new, likely two years ago I was also complaining
>> on lack of maintenance on Realtek, but the solution is not to send
>> patches to soc@.
>>
>> Solution to that would be to remove the platform, for example. Or work
>> on maintainership.
> 
> They have already offered to take over maintainership, see
> 
> https://lore.kernel.org/lkml/3ab263bfa4904b428245152b83340363@realtek.com/
> 
>> Did anyone from Realtek offered reviews to my patches posted 3 and 2
>> years ago? I don't see that.
>>
>> Kent SoC was accepted under condition this will improve.
>>
>> I drop this from soc patchwork and please do not send code for review
>> there, but either fix the lack of involvement from Realtek or let's drop
>> the platform if Realtek does not care.
> 
> As Andreas has not replied to the MAINTAINERS updated, I would
> prefer to merge both that and this patch in the bugfix branch
> for 7.0.

Sorry for that, still lacking time, but at least receiving now...

I'm happy in general for someone with more time taking over.

Last week I spoke with Realtek (at EW) about testing the newer SoCs.
As a reminder, the mainline removal of TEXT_OFFSET broke my ability to 
test the older SoCs that I had access to. I hear that Kent and other 
recent SoCs do not have the same bootloader limitations anymore.

We would need to consider moving me from M to R and possibly changing my 
email from .de to .com due to recurring quota overflows.

I.e., new maintainers would need to queue patches and send pull requests 
to soc then. Are they set up with GPG keys / kernel.org tree to actually 
take over on their own?

As for review, there was one other review discussion about ISO/Misc 
areas that I found concerning: Those areas have been clearly documented 
and (on the older SoCs I know) contained registers wildly lumped 
together (from kernel PoV), so that having them in DT and accessing via 
regmap seemed the best way to me, compared to trying to map individual 
words to specific drivers. My old branches may contain some example 
usage in queued but non-merged drivers. (Amlogic may also have similar 
concepts of always-on vs. PD-controlled peripherals grouped in DT?)

Another open thing would be help with mailing list moderation, if we 
want to continue using it. Any review responses by non-subscribers add 
to its moderation queue (plus any spam).

Regards,
Andreas

-- 
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany
Geschäftsführer: Ivo Totev, Andrew McDonald, Werner Knoblich
(HRB 36809, AG Nürnberg)

