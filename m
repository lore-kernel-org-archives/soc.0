Return-Path: <SRS0=38w0=TW=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0E1C433EF
	for <soc@archiver.kernel.org>; Fri, 11 Mar 2022 10:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 97098C340F3; Fri, 11 Mar 2022 10:29:46 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E353DC340E9;
	Fri, 11 Mar 2022 10:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E353DC340E9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MWRZr-1ncrHx3L11-00XwCd; Fri, 11 Mar 2022 11:29:42 +0100
Received: by mail-wr1-f44.google.com with SMTP id q14so12255579wrc.4;
        Fri, 11 Mar 2022 02:29:42 -0800 (PST)
X-Gm-Message-State: AOAM530pDIOspSsnmFVDH5O7QpCJKRCmjYhPnGVfNVeBR5uBW/koEfcy
	Imy6GjXg8Ws4VSTVfVOYveaZOfGt2eHsNkfhd8A=
X-Google-Smtp-Source: ABdhPJww9iZUiMXZJ3+Izo133GCVEs0KSb3nLu4xIYRNU5vWyHGpD8dOT1ZEJF4skaTeYazo6UpsOvzMgtxknbW66oU=
X-Received: by 2002:a5d:6810:0:b0:203:7cbb:20be with SMTP id
 w16-20020a5d6810000000b002037cbb20bemr6805423wru.219.1646994582277; Fri, 11
 Mar 2022 02:29:42 -0800 (PST)
MIME-Version: 1.0
References: <20220310195740.151250-1-dinguyen@kernel.org>
In-Reply-To: <20220310195740.151250-1-dinguyen@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 11 Mar 2022 11:29:26 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3E9Ch6BspdxZ6FPU9kpSGg+yECVDu+WRwgh1f8Hyvrgg@mail.gmail.com>
Message-ID: <CAK8P3a3E9Ch6BspdxZ6FPU9kpSGg+yECVDu+WRwgh1f8Hyvrgg@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] arm64: dts: socfpga: dts updates for v5.18, part 2
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:iU923+wZq8jpvXWt7hhE09TGOsgFoELaDWsUJeMrlJCyDSugvha
 Wj5HoSgofL6VMopy9qVNexves5djqXkhp9XwmNrXDUE9El8iopTapS5xJXhI+oRId7RAUiL
 DxoEtdvSeA3bD8OTxtSCOV1hjaS2vmvk5N8eOpCkyHKmISdOqmP6HZgGUokbRDxI1ugdfH/
 YGmUdwupz1fN7VrcyiSEw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rl9W5nKNlbs=:cro71TxgnabXU5e9UafNRq
 5gmliErIRU0gRyBcAub73UT4+F5eJGFVg68UoMbaY7orbUmEODWfoXOYtb5ZDW73c0JgaA8Fj
 TZu3KonXagboMkCCGN82V3FNeDChqCHaQW+CYepkQQ/hkIoAf7krOCGWfAbTZ+wFBhnkuRvM8
 +vkJ9KK+sYcboDoULX5NK4OvlYFtuhNzP0cPoZ0Zkie+tqV2pMMwYzqIMxl5N2+DlxYPsRMlj
 P/nJwZ1FXrl+hQrdFXqh48pTvs8JyD1vsRyHDqUBC/buvl/XY7Hrrt2Pen5y75AEOoQRUQXXa
 eMgOsno+Ceo1WYjOv3jtnFSOL1o034ML2nFQWmXf4IbCV/RcDsNvFOAD5Bqg85Sco4XOlFWzt
 nxypL39RVaknaPZB/3fyE+lGf9t4p3iPsCsIMXoyPm4Xvhd9mlDg7BOOrSWNYdzWz6KPWSYve
 pV+MN6r0nX4OGBuda2+sacegbS24aVIWduTivXE8FzQhRL+BUJA+9WSUQ+fU70ghGm3cWstu8
 p8i3SSfJaVOnED5W7Fdm0X3irflz9MTeI+R2uNdwInT2Wno7bWJRyVRC2gNnOM3a0gAkGLFl3
 ixzrkIw4WW0hyiDbTNqvX/OXmZc1LABz/pn8kBCX7bYgxZbbTvTO0QSume6QEM9st8RUa4GHG
 z2+3ZG7ZWZsTqKnm4tKxSpZm3Cqsfznd4AtQDnqK3gzW2eUhBpfxNIMZsNu8RoGiPlzE=

On Thu, Mar 10, 2022 at 8:57 PM Dinh Nguyen <dinguyen@kernel.org> wrote:
>
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
>
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
>
> are available in the Git repository at:
>
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_update_for_v5.18_part2

I've pulled both manually, but note that these should be public
https:// addresses
instead of the addresses you for pushing. You can configure a "pushurl" in your
.git/config.

       Arnd
