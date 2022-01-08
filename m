Return-Path: <SRS0=cpLJ=RY=lixom.net=olof@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEB6C433EF
	for <soc@archiver.kernel.org>; Sat,  8 Jan 2022 21:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7250C36AE5; Sat,  8 Jan 2022 21:58:46 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 211F4C36AED
	for <soc@kernel.org>; Sat,  8 Jan 2022 21:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 211F4C36AED
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=lixom.net
Received: by mail-pj1-f49.google.com with SMTP id hv15so2470476pjb.5
        for <soc@kernel.org>; Sat, 08 Jan 2022 13:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4Hd1sTJddOAEXNt6EvTLGETq0KW+NvG5jCzX8oMoecI=;
        b=LLZ0TYsk1sIjI6GUOYOQAq0OhqsK1A4fbANbCa+GWDCOy0mXr/bRDrc691o8vz8maJ
         b7fZ8a7qd3BmOnIH+boprZCvXmLdpSmTU3cdODLs4ydsWgPAzA4BvsLLE3X0nZACO3Ka
         KLOnhGrMpeHuKb64g8Ck+hYsCJIRwVRIJXHmb7s7Swqzt9hzKS1XHR/M1qi4sBlK8sTJ
         9lSLb1gLwGlvgfgAm3KzdpqB0xMgbGfF/ved3YBbIagst4x75D0kQhK1oP3CU5UNuH9Y
         /T91m9q9oYBNkm/pn6Kj1heTNgaAXrdFvH0Zf4S83jJQDWLE4CYoQrOIApXtzFMwGxln
         xPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4Hd1sTJddOAEXNt6EvTLGETq0KW+NvG5jCzX8oMoecI=;
        b=6MmiapImGRTx3kXTgcAzXtbZr0fjPH/BMOVBw94IhlMe9OoHcinBq7KERY0R7IVo/u
         HIue0UDpurFcH2Wk+B7uB8nlWzLPxPvvt/QxM4F4Lj4tUe+G0Nne0qvlta9S9IQBt7zj
         1kJLF9sAGmc3V/XQh79nBHhVHTMgsr9s0K3tzGQH2XYWXcnh9MR5aYFlYslYsYscB5Wk
         i1qqpm42k0QMdUXUQT24IZOGfL6nbjc4FqOJuGgJA2b3hya4ekcNznaSHtSZ+kgx/guD
         Es5AT00BkmL1K4dtBn1s6ClvUepPqtjLusFc7fpU8m2U5wANuFSz86kUWvWSUjgHbInJ
         PGdg==
X-Gm-Message-State: AOAM530GwgiCAWp9uJNtVq7Kt6QDaIzDEM41cOSu9Vj0N9Hoq3lpXEx7
	HlT7byW83KvLHTi+VApANHsVvA==
X-Google-Smtp-Source: ABdhPJyMF8b0vtRVaaTcGo+OX6AMhUl4fH8CKTllWfdUoabPmtVG/ESsRLNyLWYzPgfdK/oHzrVH/g==
X-Received: by 2002:a63:7053:: with SMTP id a19mr2963908pgn.283.1641679125568;
        Sat, 08 Jan 2022 13:58:45 -0800 (PST)
Received: from localhost (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
        by smtp.gmail.com with ESMTPSA id g9sm2781258pfj.123.2022.01.08.13.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 13:58:44 -0800 (PST)
Date: Sat, 8 Jan 2022 13:26:21 -0800
From: Olof Johansson <olof@lixom.net>
To: Neil Armstrong <narmstrong@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, arm@kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] amlogic fixes for v5.17-rc
Message-ID: <YdoBffKeAvtOeRSe@lx2k>
References: <7e40328b-6645-4343-3050-73dcfb2cefcb@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e40328b-6645-4343-3050-73dcfb2cefcb@baylibre.com>

On Mon, Jan 03, 2022 at 04:13:44PM +0100, Neil Armstrong wrote:
> Hi,
> 
> Here's a couple of DT fixes for v5.17-rc1, they fix the UART compatibles of
> the ARMv7 Amlogic SoCs and by the way keep earlycon working after [1] has been
> applied by greg in the tty branch for 5.17.
> 
> I know it's early for 5.17-rc1, but at least it's in the pipe.
> 
> I based the changes on your dt-5.17 tag pushed to linus for 5.17-rc1,
> if necessary I can rebase on v5.16-rcX.

Hi Neil,

It looks like this branch is based on our arm/dt branch? Please don't base your
topics on our branches, it'll be awkward if we ever need to rebuild them (it's
happened a few times, but we try very hard to avoid it).

In this case, you should have based your contents on top of your latest dt
branch (if it would have had conflicts), not ours.

Mind rebuilding and send a new pull request?

Thanks,


-Olof

