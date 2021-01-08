Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F89EC433DB
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 13:27:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E70C723A03; Fri,  8 Jan 2021 13:27:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C38F023A00;
	Fri,  8 Jan 2021 13:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610112470;
	bh=nt6ziUzHkm3hfrCQXU1yzp/8m62e8IE7ZOVrqdMhV9Y=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=o8BBVlEkk/2DOJqPrlhzkqXZDSFqZkIHtaZVaSWJBtjJYBm3aZHSnc2KDZOMB0Cso
	 IIOqtKc5XT9Gk29lj+idvFh5nOdwceLvPiOwEswduR8kanWQx8cwlB9nG2nA+MOTQJ
	 XxIGLD8KXiCYgpzJvGGBvqWLkUATQPCfM2zqK5LUXYVonb+lQAML0tJQTCYASBf9km
	 k9C5pWfblV2/0ki0QNrCd6tstEIdtZMMHHPUIN4+Lb1bOgGJwYtM5V+C+NegCwD0zT
	 wUztvyMBFKOd4Gv8UEu2UP3vwTGan5rCFRHuskuedmM+3JBqPy5nb5lh9qnXimmwiY
	 zs6sL+pC0ogrg==
Received: by mail-oi1-f175.google.com with SMTP id s75so11335810oih.1;
        Fri, 08 Jan 2021 05:27:50 -0800 (PST)
X-Gm-Message-State: AOAM532a427+4Ennmh772ruWk23/1iv6SZpMWG4UgDK7jhLJfIeCGhVD
	T8tu6GV6QlCJNn2JynZh/e9nyamAoOFV22wjItM=
X-Google-Smtp-Source: ABdhPJxzS4h2MK5B78Iv8vYCQh0roQTlfXNRTBFIfep0yXLkz/Fy/e07HKL+4g3po6EkgtmvS53fH+uipK43dKV2JYk=
X-Received: by 2002:aca:fd91:: with SMTP id b139mr2185199oii.67.1610112470141;
 Fri, 08 Jan 2021 05:27:50 -0800 (PST)
MIME-Version: 1.0
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com> <20210108105241.1757799-10-misono.tomohiro@jp.fujitsu.com>
In-Reply-To: <20210108105241.1757799-10-misono.tomohiro@jp.fujitsu.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 8 Jan 2021 14:27:34 +0100
X-Gmail-Original-Message-ID: <CAK8P3a22Cc4J6pr7h357p70k2eJ2dNxkHLWYC-2bMh7A1+ZhTA@mail.gmail.com>
Message-ID: <CAK8P3a22Cc4J6pr7h357p70k2eJ2dNxkHLWYC-2bMh7A1+ZhTA@mail.gmail.com>
Subject: Re: [PATCH 09/10] soc: fujitsu: hwb: Add sysfs entry
To: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 8, 2021 at 11:52 AM Misono Tomohiro
<misono.tomohiro@jp.fujitsu.com> wrote:
>
> This adds sysfs entry per CMG to show running barrier driver status
> for debugging user application. The following entries will be created:
>
> /sys/class/misc/fujitsu_hwb
>  |- hwinfo ... number of CMG/BB/BW/pe_per_cmg on running system
>  |- CMG0
>      |- core_map      ... cpuid belonging to this CMG
>      |- used_bb_bmap  ... bitmap of currently allocated BB
>      |- used_bw_bmap  ... bitmap of currently allocated BW
>      |- init_sync_bb0 ... current value of INIT_SYNC register 0
>      |- init_sync_bb1 ... current value of INIT_SYNC register 1
>      ...
>  |- CMG1
>   ...

If this is meant as a stable interface, it should be documented in
Documentation/ABI/

However, if it's purely for debugging and may not get maintained
forever, you might want to use debugfs instead.

      Arnd
