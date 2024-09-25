Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FE8154C0E
	for <soc@lists.linux.dev>; Wed, 25 Sep 2024 09:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727258090; cv=none; b=PdonnRlhukG8HFdPSZNNGBkv5l6RmWcJbPZ8pKsey1hqbnJbSpwz3KjthVPH8r8/CAulZPXwUmj47IbwiiSdlINkoFjz3GdeFfhjlzpS0DVSEVGSmEKcpzJfYOZ3jGX9aO1bH+YPGXk113oR9ZbasKSUBqVWragm06dxfcamxTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727258090; c=relaxed/simple;
	bh=34wuirK0L4D6jQbHrbv5p+25SdyD8YI5ZOohEg82MhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nDmVGqamf9CZyc5AOZoEC7ESJ0vdccf/54JxHwkdlRDF2Q0UEBbF4JaIVtyGGRicHXzJ+Of1/dsvdTvY0HNOuNB/U9NSzF60OWDEQ5fwJIQw+QWBzThdF4uFZUoAZqB6xpYj0yjMshhgjGIgMn6Ye2bXqHrHoxiUJiirFzLDz9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HWIEQjA8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HWIEQjA8"
Received: by smtp.kernel.org (Postfix)
	id 8C37EC4CECE; Wed, 25 Sep 2024 09:54:49 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8DC60C4CEC3
	for <soc@kernel.org>; Wed, 25 Sep 2024 09:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8DC60C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42e6dbc8c7dso10007035e9.1
        for <soc@kernel.org>; Wed, 25 Sep 2024 02:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727258087; x=1727862887; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1cXiR6Xltjt+awh9RdC/PODyvQNRIeHhu1r3uefkfSc=;
        b=HWIEQjA8HFERP4BoBIkYVSPBDur4MJhX3IiqbHVRk6wm3rEq3zR8m9TtrJoKBvDjtY
         tHp5YBZOPF48P4BhRbSNPvcgtYQ1KOx9x1LP8G3s7+af+7tkhQOrI3rwRdWjpJ62ycie
         KIEuIPJEE2fLleFP25kg79gPjCV8Qz83de91HI2B5ygriTh23ja+j+piBwslN/5x3RhY
         hhUcmZzLWbybdTZ1j2OyBl4x269v55DQkUYWVOh+wmfQ8ned3juHPgRrNJ/IqzoXkmSS
         O4+XOslsXj5T7n76p76wIDfG/feSIe7TEk3dXgnCrqpnC7HBUtFX1SSpoVyF8WS3tBsA
         xovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727258087; x=1727862887;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cXiR6Xltjt+awh9RdC/PODyvQNRIeHhu1r3uefkfSc=;
        b=YT8XTp5h/EitEo8cqq5/2RL582hVEywDp39r3teJK6Z5ZSPWz23sDioU8B/SDMO8hr
         hbnggpnydOOQx7S2RhehNFZ6XRTcctWk0tYVapm6pwYUVaNq4s5SJ91+0ksSlzIlusTc
         ptgbsP9830dByIJI1uDhG5TNaMdejAA6dTm3WdszRUVdB01NefVZ+23BOdDxdixfqBYc
         RuxoWUTLhbRLtRSyr5UqhUBovGakpwZ6vif046xaCC5UUI3WonBUVTeGRy5/nhKRseYi
         7nZO9UvkFHiZ9SWZNrvPbLMA4+3ZIG+a3EOV2plbXpKdIv+4nXPD5u6RnIv/rIQ/eQNm
         Fyrg==
X-Forwarded-Encrypted: i=1; AJvYcCUhU9JjdSI/x2l7razO7kyXhT8e7RgW74Y7jTbBF3utCXWYTqz+J0N8HSU7bePNaPWQiv8=@kernel.org
X-Gm-Message-State: AOJu0YyhPyDVAd2GOtcORz67AhEnaWLweVDM9KzXlfJiKss45CyIgQxl
	ORq9NqoQlLfJW/WBiivinovB4WxiXh3YHLsKT9c9GSisz27UTJ/EhX/LSmNhKOI=
X-Google-Smtp-Source: AGHT+IG0refFTe5TyUaGgmhQ6uzLehrlX7ax3e9FpVy17D0N4EKtGryX81kxNl2GE6Jjo3NCnZ+2xA==
X-Received: by 2002:a05:600c:470d:b0:42c:aeee:da87 with SMTP id 5b1f17b1804b1-42e9624f704mr6326135e9.9.1727258086779;
        Wed, 25 Sep 2024 02:54:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969e188csm13086625e9.3.2024.09.25.02.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 02:54:46 -0700 (PDT)
Message-ID: <f1f5f503-b927-4bfe-b55d-d8fd343a2ba1@linaro.org>
Date: Wed, 25 Sep 2024 11:54:43 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/process: maintainer-soc: clarify submitting
 patches
To: Conor Dooley <conor@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-arm-kernel@lists.infradead.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Will Deacon <will@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>
References: <20240924130831.38861-1-krzysztof.kozlowski@linaro.org>
 <20240924-powdery-driver-e66ea543d634@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240924-powdery-driver-e66ea543d634@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/09/2024 15:19, Conor Dooley wrote:
> On Tue, Sep 24, 2024 at 03:08:31PM +0200, Krzysztof Kozlowski wrote:
> 
>>  Most of these submaintainers have their own trees where they stage patches,
>>  sending pull requests to the main SoC tree.  These trees are usually, but not
>> -always, listed in MAINTAINERS.  The main SoC maintainers can be reached via the
>> -alias soc@kernel.org if there is no platform-specific maintainer, or if they
>> -are unresponsive.
>> +always, listed in MAINTAINERS.
> 
> I probably had some specific case in mind with that original wording. I
> presume it still holds true for some smaller platforms, but I cannot
> remember the specific case that prompted it. I'll have to see if I can
> figure out which platforms they are (if any) and get the tree added.
> 
> Cheers,
> Conor.
> 
>>  What the SoC tree is not, however, is a location for architecture-specific code
>>  changes.  Each architecture has its own maintainers that are responsible for
>>  architectural details, CPU errata and the like.
>>  
>> +Submitting Patches for Given SoC
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +All usual platform related patches should be sent via SoC submaintainers
>> +(platform-specific maintainers.  This includes also changes to per-platform or
>    ^ this is unclosed.

Ack. I have v2 with minor text changes in other places as well. I will
send soon.

Best regards,
Krzysztof

