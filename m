Return-Path: <SRS0=YLFc=P6=tuxon.dev=claudiu.beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEB5CA1018
	for <soc@archiver.kernel.org>; Sat, 31 Aug 2024 12:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F1B7BC4CEC8; Sat, 31 Aug 2024 12:11:22 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 69F53C4CEC0
	for <soc@kernel.org>; Sat, 31 Aug 2024 12:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 69F53C4CEC0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42bc19e94bdso6105915e9.3
        for <soc@kernel.org>; Sat, 31 Aug 2024 05:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725106280; x=1725711080; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=feytde++Ztupo3vQgj2y9NbMxC3wNTfdLdqPpTIHuHI=;
        b=qfbju3Hkebbw+uA1KfLFje27wfLl4Kft2lohCVTxGzaQ+DM3wUUEugnoX2pJ1K6l+5
         xBol1euUiQeU8XpYhXWSczi+KemLOt6+/F/JKSRwomHI4E5ASp7+jzzDRDXY/6tPyG4n
         1jrLvkniqmeLbm6HQ5X2CBemFKQxdeR/3lPU9tjAVGcVBl/IZ5b7YF7tdreFU42k4L5U
         XZaKdJMXiqhnKz46nYrViJNc1zD5WniS5MGr5YzpgPvY/iSz+tbwBpcyatIf8wTNIEC3
         uWaQhjnLCeM0cfYB5nz3nEfixzBbBg+2CFyGnJbnJymXbKVE3yxHg6wjG/Ci2rtRlbxv
         +GAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725106280; x=1725711080;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=feytde++Ztupo3vQgj2y9NbMxC3wNTfdLdqPpTIHuHI=;
        b=mpiLRp2HHpcnqKKpBBxVi5H4TwkJ1bGBtxb3wY16VgY4VPZGNrvgmX5XJ8d9evKjDb
         xcrDYLB5MAaXdHL65HT+UvaA9uyGya5zasVKFLHUDxvP9o0IrOGRmzwdrqfuUEw0YYr5
         ylLblcd+ArchEUT5PkXsfF0MeIvh4ow41/cAdTOjNYFh5W2QJPDPPC+0ip4S5x/m25Ut
         8lodn66FCXcAQETEbreu433mLiX+jakg5a0I+p4JQQGofAwTzMPHgywwBgp7UvlXlRt6
         +2jNiO0ApERzinZ/4v+OVhjt/Y31l1gtD7GrYMXy3X0RJqANpXaGNUubkYlLRjSSQLbj
         oH4w==
X-Forwarded-Encrypted: i=1; AJvYcCUXhyqfXCOLru4828GVBJvGVSRt3JRLT+o0qcgTu5ueqHQefdlMA9MzALU4DtdmDdf0vUg=@kernel.org
X-Gm-Message-State: AOJu0Ywoh79a1g0eZCKiXgZgyEVt3u2tCBlNdEEhk/VHXDOhh/rY18As
	s2HDLOCKrHXBWOYsXjtr6z7uoTA/mdd35d8ezZkK6Sx4TIsQcwhZcLlWagdlsO4=
X-Google-Smtp-Source: AGHT+IHuKpEMuQpTNGxnlqsC4REKBZT8yLOzdGRaRbJNR5BWy+p338FBElfkf9avmR4GBihGHTuXaQ==
X-Received: by 2002:a05:600c:3b97:b0:426:59aa:e2fe with SMTP id 5b1f17b1804b1-42bb01c2071mr64671655e9.19.1725106279378;
        Sat, 31 Aug 2024 05:11:19 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e33f5esm74010555e9.39.2024.08.31.05.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Aug 2024 05:11:18 -0700 (PDT)
Message-ID: <97adf680-8fa6-4b34-86d9-d12c6031de3b@tuxon.dev>
Date: Sat, 31 Aug 2024 15:11:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Microchip AT91 fixes for v6.11
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm <arm@kernel.org>, soc@kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
References: <20240826170749.3271888-1-claudiu.beznea@tuxon.dev>
 <2aa68d3e-9d9d-447c-a2a4-5cfbb4062ae0@app.fastmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <2aa68d3e-9d9d-447c-a2a4-5cfbb4062ae0@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30.08.2024 22:57, Arnd Bergmann wrote:
> On Mon, Aug 26, 2024, at 17:07, Claudiu Beznea wrote:
>> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
>>
>>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
>>
>> are available in the Git repository at:
>>
>>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 
>> at91-fixes-6.11
> 
> Something went wrong in your pull request, presumably an incorrect
> "insteadof" entry in your .gitconfig caused the wrong URL for your tree.

Sorry for that!

> 
> I instead pulled from 
> https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git

That's the right link. Thank you for taking care of it.

Claudiu Beznea


> 
>       Arnd
