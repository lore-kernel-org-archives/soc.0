Return-Path: <SRS0=lh3U=KB=gmail.com=chester62515@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E3EC48BF6
	for <soc@archiver.kernel.org>; Sat, 24 Feb 2024 07:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D5EAC433C7; Sat, 24 Feb 2024 07:26:02 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B9257C433F1;
	Sat, 24 Feb 2024 07:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B9257C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-29996cc6382so798403a91.3;
        Fri, 23 Feb 2024 23:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708759560; x=1709364360; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8FwIrVdhZ2az6n32/fJZBq/H4MbFnqzEludgNTAdw5I=;
        b=QcLRIGuiXrXbs4ClUpUls8VCR2a9xgYBjGHQPq4bkibgyDfjoOho1CR40botBMbtno
         dJyOGbe4KPSme8ZnXe256LbgDKy3f+eE1CcVAAF0k11WeMckBQl5ii4UU8eO7lDYrfJG
         0X7Q7qSH2t1AMKTkO0q8ailNWDGMRLKcMV4fCWIqlL4yc9dNzkiyRJuL2qSlKbMP1CYI
         VEohmfX/UGWZ5CwZ4WHM7pbC7zsds4znS07GfYOXKk4GC8Z02YKSIZzDGSsiyWq+dUR8
         OoWbWr16N9eAqrpaohlvOtVnUOzLzuTFsAyPW2NhyZK8S/uiBU3C9ADm5hEjU8D6kkrp
         zE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708759560; x=1709364360;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8FwIrVdhZ2az6n32/fJZBq/H4MbFnqzEludgNTAdw5I=;
        b=rzblCFMzCVBzkMnCZopyyXXCBLJiiUDipX7aVMjXT+B8KSB2j09oyRrroZcosqcaQo
         oY+hu58HdhI4hUKgFcd2SD+Bye5sMB0dJISw80LWRncLDNHic6Jt7etyJn30BYPnxozS
         sI1+tUOHkAl9NvHqUqOgTSmnRm7yP8+2YTeinLOKXiKR+g7s59bUofk/uPiKMdHq+Q5u
         8+7Xl2pIcQD611lx5XCc3TdEWoBrrKDCEW7U58XrV4wWFmWnQuudZkHInkhRDTjRtGSL
         ZTGe8B00iY0/rnXH9bJYQLNvcYwxDD4xlw48XXjJBDA6ohygw7iF6E9+wk69Biv+UT6G
         3/ag==
X-Forwarded-Encrypted: i=1; AJvYcCXod9SOVEX/S28fghAAYww0cCVXtYf4kZ7BsmDPWKWMayTb5nj8IPjQb6QJB7cybg9ud0JsQoxTKbkRixzItyRz5rnQmbzEDel0CJL696GWr+X4xkgKDsjfyLGmKeIM5fm0oXkP2LJY
X-Gm-Message-State: AOJu0YxDVV6NyHIeaWpCEaWuXrCvGea9AX9YL8hlmiBE9FsdFCihx1lJ
	pcQh04fh9p7NefPwyiGo8UG9L5g8HDsu3eFqsVfXlIbdD7eFJceh
X-Google-Smtp-Source: AGHT+IH9MCglILdIP6ug54fLmEhNX4iNeGOTd0ZiNXDK8PZDH305OShsG7z7ZfcMlrGTTXKnY4wbDQ==
X-Received: by 2002:a17:90b:238b:b0:29a:a3cc:b174 with SMTP id mr11-20020a17090b238b00b0029aa3ccb174mr83613pjb.4.1708759559781;
        Fri, 23 Feb 2024 23:25:59 -0800 (PST)
Received: from linux-8mug (220-129-204-58.dynamic-ip.hinet.net. [220.129.204.58])
        by smtp.gmail.com with ESMTPSA id s62-20020a17090a2f4400b002992f49922csm715153pjd.25.2024.02.23.23.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 23:25:59 -0800 (PST)
Date: Sat, 24 Feb 2024 15:25:20 +0800
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
Message-ID: <ZdmZ4JC0CsX2qs5C@linux-8mug>
References: <20240221120123.1118552-2-ghennadi.procopciuc@oss.nxp.com>
 <f4465547-1fb1-4578-9a69-7d399e7661b3@linaro.org>
 <403e32c2-910e-4745-9ebe-fbf377c3fde8@linaro.org>
 <ad856766-8903-46c0-93af-24e101ad51dc@oss.nxp.com>
 <e538ded0-bd3a-4ca4-b2bd-8d20d8c8c3fe@linaro.org>
 <bcb79af4-56d9-4204-9503-cff996f1ba41@oss.nxp.com>
 <e6f6070e-8355-4a0b-a904-1a24970f249b@linaro.org>
 <e530d504-dfa3-4d39-b903-b2570bb8b014@suse.com>
 <c3e68c62-b81f-475b-9b15-c983c94aed8b@app.fastmail.com>
 <Zdiu8s5Cgz9s6dLP@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zdiu8s5Cgz9s6dLP@dragon>

Hi all,

Sorry for the late reply since I lost connection with upstream due to a
health condition, which affected my eyesights for a while so I tried to use
my eyes as less as possible. Please accept my apologies anyway.

On Fri, Feb 23, 2024 at 10:42:58PM +0800, Shawn Guo wrote:
> On Fri, Feb 23, 2024 at 01:29:10PM +0100, Arnd Bergmann wrote:
> > On Fri, Feb 23, 2024, at 13:02, Matthias Brugger wrote:
> > > On 22/02/2024 12:13, Krzysztof Kozlowski wrote:
> > >> On 21/02/2024 18:00, Ghennadi Procopciuc wrote:
> > >> 
> > >> Andreas or Matthias,
> > >> Maybe you could change your R: into M: and take s32g patches?
> > >> 
> > >> If not, then I will ack this patch making Ghennadi the maintainer.
> > >> 
> > >
> > > Normal process would be that Arnd would contact Chester to see if he is 
> > > not able 
> > > to do the maintainer work any more. In that case maybe Arnd could take 
> > > over.
> > 
> > I was hoping to see a reply from Chester one way or another,
> > I see he has been on Cc for the entire thread but not
> > chimed in.
> > 

Before leaving SUSE I reached NXP to see if anyone could take over it but I
didn't get response unfortunately. Maybe it was too rush to find a right person
at the moment but I still wish that someone can take over this role based on the
following reasons:

- Since I have returned my S32G boards to SUSE, currently I do not have a platform
to verify S32G patches unless I could get a new one. I wish I could still help
out but hardware & doc resources will be the biggest challenge to me.

- My current employee may have competitive relationship with NXP in automotive
field, which means I may not be fit in this role unless nobody cares.

> > > I'm not saying that Ghennadi won't be able to defend this, if it ever occurs. 
> > > Basically because I don't have a good track record of him due to missing 
> > > upstream collaboration.
> > >
> > > I would prefer that Arnd (or Andreas) step up to take the maintainer role. I 
> > > already have one and it's difficult for me to find the time to do it in an 
> > > acceptable way.
> > 
> > It appears that we already cover the dts files in the IMX
> > entry, whether that is intentional or not:
> > 
> > ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
> > M:      Shawn Guo <shawnguo@kernel.org>
> > M:      Sascha Hauer <s.hauer@pengutronix.de>
> > R:      Pengutronix Kernel Team <kernel@pengutronix.de>
> > R:      Fabio Estevam <festevam@gmail.com>
> > R:      NXP Linux Team <linux-imx@nxp.com> 
> > L:      linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > S:      Maintained
> > T:      git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> > F:      arch/arm/boot/dts/nxp/imx/
> > F:      arch/arm/boot/dts/nxp/mxs/
> > F:      arch/arm64/boot/dts/freescale/
> > 
> > Added everyone there to Cc, having any s32 patches go through
> > the imx tree would be the easiest way as far as I'm concerned.
> > I've added the maintainers to Cc, let's see what they think.
> 
> It's unintentional that IMX entry covers s32 dts files, as they have a
> dedicated entry.
> 
> ARM/NXP S32G ARCHITECTURE
> M:      Chester Lin <chester62515@gmail.com>
> R:      Andreas Färber <afaerber@suse.de>
> R:      Matthias Brugger <mbrugger@suse.com>
> R:      NXP S32 Linux Team <s32@nxp.com>
> L:      linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> S:      Maintained
> F:      arch/arm64/boot/dts/freescale/s32g*.dts*
> 
> However I'm fine with collecting and sending patches through IMX tree,
> if S32G folks help review them.
> 
> Shawn
> 

This looks good to me as well.

Regards,
Chester
