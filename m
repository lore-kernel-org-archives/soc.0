Return-Path: <SRS0=O1iE=KH=gmail.com=jernej.skrabec@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DEBC5478C
	for <soc@archiver.kernel.org>; Fri,  1 Mar 2024 17:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 950ADC43394; Fri,  1 Mar 2024 17:22:37 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A84C9C433C7;
	Fri,  1 Mar 2024 17:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A84C9C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33e162b1b71so1280751f8f.1;
        Fri, 01 Mar 2024 09:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709313755; x=1709918555; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37WDRV9x4Xm24khamq/oQN+S82VH6v/HallOiNR2z8I=;
        b=YmlOr4jUBqvvvv5Fo4W84NAZhgK5sYscRv2MRb1y3eO8Xkf9dhWCIPMhWMY1XU84uZ
         p9bpjgViZ0RtalMO/uOlsc+uOPwAn2oQaPxPJuPkYCEySyV08oTildrJxVxQosbyP/Xz
         J8vGY1zaZGbl28syBuI5b3NmZRqr8O9geKQfYTEMmF2oK1uVSbS2lwugfvFS/YagNmHK
         5Qde7v/PofShpULsE54WAH3KOc3IJV8Yt8VXZRWNfn8ehRXju/Y/wqrnMuUyfQiEoD63
         xdx9QqohNSeu6dceJQpvhJSCwKBgP8cEWoZGwS84hdLX/BfMUznGjLkOo74/EHOTHqL0
         q43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709313755; x=1709918555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=37WDRV9x4Xm24khamq/oQN+S82VH6v/HallOiNR2z8I=;
        b=hKZ7uDtLZEj/8E5iAMFoVP5fvxHyXJ7A5YrKsWJwX8DoYHeZzY/2jgmrIfJZuv4b4I
         6JbGo6d0nkNNmXf/X+aG5cFtxd8BYipFb40Q4nCRO+KwPCuuJ3Iwl/VPOXXy0Yj/hYk8
         +SLolNJ3Aqi6iUAFwjpvftr4UBmK2sYwPKMNAAohcQkOzgN5L6M2LefmiUXd98lMlH9d
         AltfsXW8xi6AGoLUSsRwQW9AuMVWsfq7co4xc36/EFpeyY/q1dlhVAe8xtow6vChWah5
         C9K0/BDeO39SXuswwGCdxXhcVhf2rznEw9vTGUHNPrUKOF5waG1wZWJ0srIQ5XMyTS0U
         7Wjw==
X-Forwarded-Encrypted: i=1; AJvYcCV1kWuLm2TeHzGzMuAqGCrt26KLU52hYzrney66O0BusNnnldoMtyu7YIHmo4GaYvjukiVy+aVJ+NOsnEI0lV7jeEI7/cYF3R6OowGnQWk=
X-Gm-Message-State: AOJu0Yxu6FlCRfyawqYZhmXSb2016uARI2MDNB44w0FOfs4U2RMilRSF
	jvYSzX0tvZ388wnI8h6RRA/8OAQ5t+iZQy/EUGV1MT6JcXicrHinVZUCYo5s
X-Google-Smtp-Source: AGHT+IGtVWAQft25IP1iqNWRhDEMUGcaRacUUSQk9h+swOPYRkaoHEXxo+JZvWLEqXKiNPyGToM3cA==
X-Received: by 2002:adf:b649:0:b0:33e:1f2b:a468 with SMTP id i9-20020adfb649000000b0033e1f2ba468mr1578174wre.24.1709313754549;
        Fri, 01 Mar 2024 09:22:34 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id h18-20020a5d5052000000b0033cf4e47496sm5013576wrt.51.2024.03.01.09.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 09:22:34 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Jernej Skrabec <jernej@kernel.org>, arm <arm@kernel.org>, soc@kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [GIT PULL] Allwinner device tree changes for 6.9
Date: Fri, 01 Mar 2024 18:22:32 +0100
Message-ID: <2203755.NgBsaNRSFp@jernej-laptop>
In-Reply-To: <3990c5be-6173-4c20-96ca-79e22cb4a40f@app.fastmail.com>
References:
 <20240223210408.GA9248@jernej-laptop>
 <3990c5be-6173-4c20-96ca-79e22cb4a40f@app.fastmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 01. marec 2024 ob 10:54:41 CET je Arnd Bergmann napisal(a):
> On Fri, Feb 23, 2024, at 22:04, Jernej Skrabec wrote:
> > Hi!
> >
> > Please pull following device tree changes for 6.9.
> >
> > Note that this is based on top of fixes for 6.8:
> > https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git 
> > tags/sunxi-fixes-for-6.8-1
> >
> 
> I've pulled it into the soc/dt branch manually, as b4 refused
> to pull it because it got confused by the text above and
> assumed it should pull from the fixes branch, which does not
> match the commit ID below.
> 
> Having the stacked pull requests is otherwise the right idea,
> just maybe next time only mention the branch name rather than
> the URL that can confuse tools.

Sorry about that. I'll do that next time.

Best regards,
Jernej

> 
>        Arnd
> 
> >
> > The following changes since commit cbec657208bdd4bff4ff31cac5924aa18817027c:
> >
> >   arm64: dts: allwinner: h616: Add Orange Pi Zero 2W to Makefile 
> > (2024-02-23 21:02:51 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git 
> > tags/sunxi-dt-for-6.9-1
> >
> > for you to fetch changes up to f4318af40544b8e7ff5a6b667ede60e6cf808262:
> 




