Return-Path: <SRS0=0UKj=FT=google.com=willmcvicker@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F3BE9272B
	for <soc@archiver.kernel.org>; Thu,  5 Oct 2023 19:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 781AEC433C8; Thu,  5 Oct 2023 19:26:48 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DED78C43391
	for <soc@kernel.org>; Thu,  5 Oct 2023 19:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DED78C43391
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1c60128d3f6so34835ad.0
        for <soc@kernel.org>; Thu, 05 Oct 2023 12:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696534006; x=1697138806; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N5wvhBkE/Y4VMn6AJO1ol9tVQweOIpEQMTvvNcvIVBY=;
        b=MkKd29PtQmMshPpsSQC3FyNsOS/2ZQQvUDH1E70PhZKZhMjfPjmrG0IHBAyxsiMVpK
         SSPprtTArETqvE4E0aYIM1CmPb9petJr2C+sdq0AlgSi/sJ3JPk3HDzB2MLZND5KGGvs
         YHVgCoODloXCe9xdV8QqbtDSHr9AIUu2CGqUVvA8H+5ByznStrCXPF12poqHLjf9Gy1S
         ncVoN45tBLoDLmzQkCCjGZHwkc9ZgZnHidaMUaySuSUoj5QLMGSzMb6Bv6At24xnVshI
         XDifYVMIidjaYleV0l640HO+tNY5Zc0QJzD5DgYHrxvGkoFL84xrljERhzoo51V4H0U5
         pjqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696534006; x=1697138806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5wvhBkE/Y4VMn6AJO1ol9tVQweOIpEQMTvvNcvIVBY=;
        b=P56LV04sR8U7euakpFIpwT82Mpf3i7eB2CWxEyQ3kEmXFavzZZGq01Fv+uWxK3UWzS
         Qn8GpLnmjqcgyNE3KcEXa/QDeG3wAqdlCOAt2xnZxitSfZZDIP1Pgf9IJAkW1aKnZXs2
         htuNNgPMd1SMPZ8PeMZwSvD40vebHA21Yk8QWbh8El4ONKKVTOT20ePC+045950nNHlC
         Md9TbdWjrxRwWPuOHWeqRxY8b6+n1QGVmo93oVJzSkKYCe44Q2IdPi8pQvjVtc/NkSpo
         Zb/ljYnuDqv/truFSF5lQFnnpxTCte18zc3uXS0+iNPA5B/mxcd9K5o+f9f6z2C01L4m
         Cbwg==
X-Gm-Message-State: AOJu0Yy7WLBOl08/Flc8jzmrohq6wVTmU+OfXpJccaSC9tShOha4XKwz
	u1uehTEUUlFvrzZNXrcj/THxSg==
X-Google-Smtp-Source: AGHT+IEvlW5ijXe/2pcrast4aYhuAkaqOVIKwMflwNG+XXHh2gpdTvxD9kb2uTNW+B8NtUSf9Nq2Xw==
X-Received: by 2002:a17:902:f54b:b0:1c5:6691:4931 with SMTP id h11-20020a170902f54b00b001c566914931mr179417plf.12.1696534005954;
        Thu, 05 Oct 2023 12:26:45 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id i11-20020a17090332cb00b001bfd92ec592sm2097592plr.292.2023.10.05.12.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 12:26:45 -0700 (PDT)
Date: Thu, 5 Oct 2023 12:26:42 -0700
From: William McVicker <willmcvicker@google.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
	s.nawrocki@samsung.com, linus.walleij@linaro.org,
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de, olof@lixom.net,
	cw00.choi@samsung.com, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, semen.protsenko@linaro.org,
	soc@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
	gregkh@linuxfoundation.org, kernel-team@android.com
Subject: Re: [PATCH 18/21] arm64: dts: google: Add initial Google gs101 SoC
 support
Message-ID: <ZR8N8rxnYOgPXHJK@google.com>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-19-peter.griffin@linaro.org>
 <ZR75cIvnQS2cqTT3@google.com>
 <db02684f-c32b-4e09-8752-8d07dcb518c3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db02684f-c32b-4e09-8752-8d07dcb518c3@linaro.org>

On 10/05/2023, Krzysztof Kozlowski wrote:
> On 05/10/2023 19:59, William McVicker wrote:
> > On 10/05/2023, Peter Griffin wrote:
> >> Google gs101 SoC is ARMv8 mobile SoC found in the Pixel 6,
> >> (oriole) Pixel 6a (bluejay) and Pixel 6 pro (raven) mobile
> >> phones. It features:
> >> * 4xA55 little cluster
> >> * 2xA76 Mid cluster
> >> * 2xX1 Big cluster
> >>
> >> This commit adds the basic device tree for gs101 (SoC) and oriole
> >> (pixel 6). Further platform support will be added over time.
> >>
> >> It has been tested with a minimal busybox initramfs and boots to
> >> a shell.
> >>
> 
> William,
> 
> Please do not Cc non-existing mailboxes. You added Cc kernel-team and we
> all got awesome bounces now:
> 
> "We're writing to let you know that the group you tried to contact
> (kernel-team) may not exist, or you may not have permission to post
> messages to the group. A few more details on why you weren't able to post:"
> 
> Best regards,
> Krzysztof
> 

Sorry, I mistyped the email. Should have been kernel-team@android.com.

Regards,
Will
