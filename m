Return-Path: <SRS0=cpLJ=RY=lixom.net=olof@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C078C433EF
	for <soc@archiver.kernel.org>; Sat,  8 Jan 2022 21:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7ECF9C36AE3; Sat,  8 Jan 2022 21:58:48 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C269AC36AF2
	for <soc@kernel.org>; Sat,  8 Jan 2022 21:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C269AC36AF2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=lixom.net
Received: by mail-pl1-f179.google.com with SMTP id q14so8786605plx.4
        for <soc@kernel.org>; Sat, 08 Jan 2022 13:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ewMb6x8qSgRhiQLnj41jmD5Jf2Gw2+saUAqctPrcO2c=;
        b=w9/7KlPbT9FQyV+9mSQdPl9F78lvYzYDszYA2ivdbja+c4oJE5crdNClxmu/GffdUA
         /TSjYcOlabCO7psTxdZJvCm1egr3Gp31fR/asnrlJSZFHZdPCPHWaiEfySl7BcQm1y9I
         GonrvTbMoJOFAwAvSK7FffJn49ehieE7WBF6fk+zEZLOr3MjqFlHP1zwiucbCJj/o133
         z1DTkurh+zVTV2zzGYiiMyeZStpw6CdqPW7t7K4t7aaSf09LgvtiWLapirj46h6o4iZz
         6oL23Ttl2mjYK+fmOgXEX5Eps4VCbAG8MEbn/WwQ/SjvqMITgM5r9qO5jQvG05kUuqTw
         HrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ewMb6x8qSgRhiQLnj41jmD5Jf2Gw2+saUAqctPrcO2c=;
        b=ssncETX9Ty3ub3EUUwxyJ949ASfm0Py7MxQlGOvRgbvr+hwdp6A4EzK5mfnNr0Lg+C
         cLHzSMwzOth9o87toYI6NlActOFSRNW72wnNx7M5gQQrNThizyIYJJ1t9voFMzNvqXlp
         MopaghCI6MpEmfEdf0sGsZfDlQ0LiiR5/w8ho4ylhW+BuYp7JjJHxweUqFrQ/qppulxI
         OT0yG/kP522NoIyp1y/bzraDpYceFL/DPCA1vBmfbLW87PrW76gKW/HRgKHahNDsaKKX
         oBtIiI4Dnn+iBQF9fN5tHFKSzD4wSj2ujg5jTka5pqfYXSCcx9O12gMNq4g0e0TBPmvr
         0HpA==
X-Gm-Message-State: AOAM533zNXdA+0zcHl4mq2q4MXV8w3iscZ5Y+IAcf3WmBkGEfowImU7m
	r29sl6LXvQeAj+xyuMaY2LEpww==
X-Google-Smtp-Source: ABdhPJwxLq2cEmd460c6VV/QK+DLhkjh2M1rDHCU9wbX7c4uGX+Td1WeqSvq3fdLkFCxPAEho1fNKg==
X-Received: by 2002:a63:6b07:: with SMTP id g7mr62621216pgc.234.1641679127302;
        Sat, 08 Jan 2022 13:58:47 -0800 (PST)
Received: from localhost (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
        by smtp.gmail.com with ESMTPSA id s8sm2862623pfu.58.2022.01.08.13.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 13:58:46 -0800 (PST)
Date: Sat, 8 Jan 2022 13:58:40 -0800
From: Olof Johansson <olof@lixom.net>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] Apple SoC MAINTAINERS updates for 5.17
Message-ID: <YdoJEMjEr5jKwLf7@lx2k>
References: <24ae6871-3e67-5c7f-2060-28048db439a2@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24ae6871-3e67-5c7f-2060-28048db439a2@marcan.st>

On Sat, Jan 08, 2022 at 02:13:49PM +0900, Hector Martin wrote:
> Hi SoC folks,
> 
> Please merge this trivial MAINTAINERS change for 5.17.
> 
> This commit was waiting on the watchdog driver to be merged, but I only
> just now realized that it silently did. Sorry for the last-minute pull.
> If this can't make it into the 5.17 merge window, it can be added as a
> fix later instead.
> 
> The branch is based on asahi-soc-dt-5.17-v2 to avoid a merge conflict
> with other changes that happened there.

Hi,

I've merged a bunch of outstanding pull requests into an arm/late branch, but
I'm holding on to this one for a bit, we'll merge it once the main branches
have gone in, since it contains a bunch of that contents. Since it's just
a MAINTAINERS update it's fine to merge late, no need to soak in -next.


-Olof
