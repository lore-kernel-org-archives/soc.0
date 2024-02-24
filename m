Return-Path: <SRS0=lh3U=KB=gmail.com=chester62515@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F037C48BF6
	for <soc@archiver.kernel.org>; Sat, 24 Feb 2024 07:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F712C433F1; Sat, 24 Feb 2024 07:56:30 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2E7D8C433C7;
	Sat, 24 Feb 2024 07:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2E7D8C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6e2e44aad03so476185a34.2;
        Fri, 23 Feb 2024 23:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708761388; x=1709366188; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y8sglNePCSMSi5IqnrzNYnc4tT2Fr0iNViHdobjpZpo=;
        b=ZQplVemFen7OsyQhYbjPyrDoqlKxFaGVOkJjtH3y5TtO++g5+gIJaGOwi9qLH+F6dF
         xSiueUeMA+kENUGMZOExvX5hKWwMiryCY1jE/HuVjLM4n8pH0LeUMgW6UeUimHZW1JFJ
         rLr+t86QglpB7Cu09+QAdvTJT2Z1VJ9DOl5ihZDrlykUwq0bGbaa/viWJn6SwfbWOlef
         YA7d/xBIAqu8chZOyS5FZ2mCy1EdIR2TXneUAL+7nWEiWZoo5MXd3AEdNIMF8Pc9FWzD
         i/Nf9h7nSLEvYUovXjjtByfgydwdPrnkO/ULPuyfiCPnHkOjNjRyPIidZ+HzdoVSYhbM
         GXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708761388; x=1709366188;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8sglNePCSMSi5IqnrzNYnc4tT2Fr0iNViHdobjpZpo=;
        b=fhyQGNw7x/EEWQ2CjYo1zQk1XsAiXMBWfqnkWXprQ5Xom9VbHBbRlABh2FfRXup1Ow
         GBRXrSfO5sru+5KQbAnb/Ze0Z9t17wiCnZmt+HMtRjJmm35M/4nsqS4Z3Rb9gPkENvYH
         AH2s36c4vKYgQaKvMoVRm1d7+tTqdtbxYKf9Zpr7pL6RyesZAJ+trWhK1MYyWjwlbvzS
         CJshjywgqx0drtknscHj8/SWpTz68MdQEoC4/j5M80iYXY1zd9bczzqYvUfPb96vAnQY
         FfCN1/HcYmOwqxrX3Fn+JKfYdTiFnlIBdtst8DIIPRI5vdQ9M4t355sc0HUqfP50XAxd
         351g==
X-Forwarded-Encrypted: i=1; AJvYcCXSfP8e2tsqb0TtEWOLQzanmUiVrdaZzc4Ibn42LZ7IS+uRecnAZyUtfg8AtFdsRUC1p9G/1lmtyA5vVvvZucGN5275Zk+NGj+/kgE54pmWApRUTbmJe+q9b6BspXKgCf73iu9TaEH5
X-Gm-Message-State: AOJu0YypQ/y96wcK0MZfMFRkNp0NJhWBDFgaewyHv4gJk3cNhaGYPpgz
	LMACeX3sBRoT9bX3Zyk/F9b/WFW4eqW47ckrxDvhj+CHSyYvQMNc+ncfqfsaouDrhw==
X-Google-Smtp-Source: AGHT+IEV9ATHXsSBXOaESxp8hcJpWt9j4Vn9NA9VXFGniCEosDTRguCCOfcudyOQNKtxFGrWlkVHQg==
X-Received: by 2002:a05:6830:11c5:b0:6e4:909a:9848 with SMTP id v5-20020a05683011c500b006e4909a9848mr442082otq.2.1708761388001;
        Fri, 23 Feb 2024 23:56:28 -0800 (PST)
Received: from linux-8mug (220-129-204-58.dynamic-ip.hinet.net. [220.129.204.58])
        by smtp.gmail.com with ESMTPSA id v9-20020aa78509000000b006e45d5f0645sm613545pfn.101.2024.02.23.23.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 23:56:27 -0800 (PST)
Date: Sat, 24 Feb 2024 15:56:12 +0800
From: Chester Lin <chester62515@gmail.com>
To: Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Matthias Brugger <mbrugger@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Olof Johansson <olof@lixom.net>, krzysztof.kozlowski+dt@linaro.org,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	soc@kernel.org, NXP S32 Linux Team <s32@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: Add maintainer for NXP S32G boards
Message-ID: <ZdmhHEbpbzNNeNb/@linux-8mug>
References: <f4465547-1fb1-4578-9a69-7d399e7661b3@linaro.org>
 <403e32c2-910e-4745-9ebe-fbf377c3fde8@linaro.org>
 <ad856766-8903-46c0-93af-24e101ad51dc@oss.nxp.com>
 <e538ded0-bd3a-4ca4-b2bd-8d20d8c8c3fe@linaro.org>
 <bcb79af4-56d9-4204-9503-cff996f1ba41@oss.nxp.com>
 <e6f6070e-8355-4a0b-a904-1a24970f249b@linaro.org>
 <e530d504-dfa3-4d39-b903-b2570bb8b014@suse.com>
 <c3e68c62-b81f-475b-9b15-c983c94aed8b@app.fastmail.com>
 <Zdiu8s5Cgz9s6dLP@dragon>
 <ZdmZ4JC0CsX2qs5C@linux-8mug>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZdmZ4JC0CsX2qs5C@linux-8mug>

On Sat, Feb 24, 2024 at 03:25:59PM +0800, Chester Lin wrote:
> Hi all,
> 
> Sorry for the late reply since I lost connection with upstream due to a
> health condition, which affected my eyesight for a while so I tried to use
> my eyes as less as possible. Please accept my apologies anyway.
> 
> On Fri, Feb 23, 2024 at 10:42:58PM +0800, Shawn Guo wrote:
> > On Fri, Feb 23, 2024 at 01:29:10PM +0100, Arnd Bergmann wrote:
> > > On Fri, Feb 23, 2024, at 13:02, Matthias Brugger wrote:
> > > > On 22/02/2024 12:13, Krzysztof Kozlowski wrote:
> > > >> On 21/02/2024 18:00, Ghennadi Procopciuc wrote:
> > > >> 
> > > >> Andreas or Matthias,
> > > >> Maybe you could change your R: into M: and take s32g patches?
> > > >> 
> > > >> If not, then I will ack this patch making Ghennadi the maintainer.
> > > >> 
> > > >
> > > > Normal process would be that Arnd would contact Chester to see if he is 
> > > > not able 
> > > > to do the maintainer work any more. In that case maybe Arnd could take 
> > > > over.
> > > 
> > > I was hoping to see a reply from Chester one way or another,
> > > I see he has been on Cc for the entire thread but not
> > > chimed in.
> > > 
> 
> Before leaving SUSE I reached NXP to see if anyone could take over it but I
> didn't get response unfortunately. Maybe it was too rushed to find a right person
> at the moment but I still wish that someone can take over this role based on the
> following reasons:
> 
> - Since I have returned my S32G boards to SUSE, currently I do not have a platform
> to verify S32G patches unless I could get a new one. I wish I could still help
> out but hardware & doc resources will be the biggest challenge to me.
> 
> - My current employee may have competitive relationship with NXP in automotive

"My current employer". Sorry for my stupid typo.

Chester

> field, which means I may not be fit in this role unless nobody cares.
> 
> > > > I'm not saying that Ghennadi won't be able to defend this, if it ever occurs. 
> > > > Basically because I don't have a good track record of him due to missing 
> > > > upstream collaboration.
> > > >
> > > > I would prefer that Arnd (or Andreas) step up to take the maintainer role. I 
> > > > already have one and it's difficult for me to find the time to do it in an 
> > > > acceptable way.
> > > 
> > > It appears that we already cover the dts files in the IMX
> > > entry, whether that is intentional or not:
> > > 
> > > ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
> > > M:      Shawn Guo <shawnguo@kernel.org>
> > > M:      Sascha Hauer <s.hauer@pengutronix.de>
> > > R:      Pengutronix Kernel Team <kernel@pengutronix.de>
> > > R:      Fabio Estevam <festevam@gmail.com>
> > > R:      NXP Linux Team <linux-imx@nxp.com> 
> > > L:      linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > > S:      Maintained
> > > T:      git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> > > F:      arch/arm/boot/dts/nxp/imx/
> > > F:      arch/arm/boot/dts/nxp/mxs/
> > > F:      arch/arm64/boot/dts/freescale/
> > > 
> > > Added everyone there to Cc, having any s32 patches go through
> > > the imx tree would be the easiest way as far as I'm concerned.
> > > I've added the maintainers to Cc, let's see what they think.
> > 
> > It's unintentional that IMX entry covers s32 dts files, as they have a
> > dedicated entry.
> > 
> > ARM/NXP S32G ARCHITECTURE
> > M:      Chester Lin <chester62515@gmail.com>
> > R:      Andreas Färber <afaerber@suse.de>
> > R:      Matthias Brugger <mbrugger@suse.com>
> > R:      NXP S32 Linux Team <s32@nxp.com>
> > L:      linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > S:      Maintained
> > F:      arch/arm64/boot/dts/freescale/s32g*.dts*
> > 
> > However I'm fine with collecting and sending patches through IMX tree,
> > if S32G folks help review them.
> > 
> > Shawn
> > 
> 
> This looks good to me as well.
> 
> Regards,
> Chester
