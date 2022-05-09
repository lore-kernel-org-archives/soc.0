Return-Path: <SRS0=y3QB=VR=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AC0C433FE
	for <soc@archiver.kernel.org>; Mon,  9 May 2022 14:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BEE84C385A8; Mon,  9 May 2022 14:34:55 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2EB24C385AE
	for <soc@kernel.org>; Mon,  9 May 2022 14:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2EB24C385AE
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f179.google.com ([209.85.219.179]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M4aEC-1npiMn3wPe-001eL0 for <soc@kernel.org>; Mon, 09 May 2022 16:34:52
 +0200
Received: by mail-yb1-f179.google.com with SMTP id i38so25257824ybj.13
        for <soc@kernel.org>; Mon, 09 May 2022 07:34:51 -0700 (PDT)
X-Gm-Message-State: AOAM530ouAVXb0aVbCEwAJlz0GrTQ27Bfabx5LYyAwj5/uRi9apdKeMi
	i/SCsWFyUK9LQFZHYjm/z8dYetzLXrzEiYKS6pM=
X-Google-Smtp-Source: ABdhPJzlnsRyRFsc62gi+qx5cltbNIAT4S964Gp1TuZQoSV8onMzOxVoze0NR6unPvCKGJ8Y/Qgmmr5dh2j53WXhMvY=
X-Received: by 2002:a25:c50a:0:b0:647:b840:df2c with SMTP id
 v10-20020a25c50a000000b00647b840df2cmr13146614ybe.106.1652106890792; Mon, 09
 May 2022 07:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220427114200.111904-1-carsten.haitzler@foss.arm.com>
In-Reply-To: <20220427114200.111904-1-carsten.haitzler@foss.arm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 9 May 2022 16:34:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2dx+qV_LmbtveD8kEi9LhRSXBvgQ-a63bRcXB=niGOfg@mail.gmail.com>
Message-ID: <CAK8P3a2dx+qV_LmbtveD8kEi9LhRSXBvgQ-a63bRcXB=niGOfg@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable modules for arm displays
To: carsten.haitzler@foss.arm.com
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:oPkejGc0uwGsJqdfsFxQGPijyGazbGE2Z3Cvho42KhpkWGLhSjT
 agJ8GCofd8nBwSAH7u1gQKVROmJMoJYH34dBnGN1EGEfF97dleClWQeTpdUS5QeiKpD2WNC
 0YHMJPUFdbp+ja4dQwY9Gd1R/21D4bHUKTYeogfLYygzxnH5Pf8wJ4aqFBdAACnV0VZI9Uj
 wQjWs75+n9X+SjUwwu0YQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1SxeCDoifCU=:CLJUggNY3IlRMpy3uKtq+n
 Jl8/NZmEMvOYxFKmelr+ousIt0PrN2gAXR+iWGdw6sC+FpbsD321jPDwx0I7BNOldkLGxAILF
 hE01xwrItKOSLZLlS+vTQ5NmwxzP/OzjwIC7+8vhYVzrpI7RwVV0SubdbSTE+ml+Kqkox3glm
 EcKbm9Azt7+wbbBzZuVsfdCNjc5J/Njcw9R2LiB2Poj96XpnWmwqU42bqSm1IhGGMswX24/EP
 IOfwJlaCqyA2OGqilaXsu+ar6f7MnieRM+xz+xPqH5FQMBe2VtljKdjiXXhATuYbpUc2Bc03B
 O34PlQxKk+8AVh4KOWexA3OpZCpTyjaK3U/7mQUZt5z5lvMIwC5Um5zdUXK7/aSgLsMmNRvkV
 hFgfCExZYzlXcU+zEYrFXKBTSJR4er/yiLOZu1z9NLhfhcZYwQ4djIZYPZNkIMAkFE05PctxZ
 Z/p9tOA1DoLI3nvguq3cOCFdRaU5Xg85H2McQJfZ9kM0l9h4BgK1NnfPxVQ2Uovi8nKdP8Bac
 LLL8flmpeGAGiUSHpZiNvTI5FWgSDins2KgRUAzGy3cD2AxFM9BNl5fYeqW1xgY7G8RYOxof6
 6ApNc8agQmVYD5vcL9Rmbtbz+4F4WsYYpEr7HH2tBjeCHiqyiWGijwFfjttRSa5+nCAAcDxX9
 e0n+HexF9ml9dPNVawdXXFKK9q+0cVbxsnQ2fCJYsCuRxaoU0rAWcQJoaYI25xQF5/jzpkiHr
 0jkAf/uj6vkrPQK78Lh7mg0c8GPC5XUvYavekXFNL3KTcJ1HeQ+0ZQ0Mu6cDblk4kUXYnVt4y
 7QpccFJg8Zk8MOyo05+1hf5jVL84N9WIZ6V7NubOaK8Fl4t3pY=

On Wed, Apr 27, 2022 at 1:42 PM <carsten.haitzler@foss.arm.com> wrote:
>
> Key devices that support displays on SoCs like the Komeda DRM driver, the
> older HDLCD were not enabled by default and should be so displays can work
> out of the box on defconfig. Also Candence I2C support should be enabled so
> the PHY and thus displays can work too.
>
> Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>

I applied this patch on Apr 27 after you first sent it. There is normally an
automated confirmation email after it gets uploaded, but I think this did not
happen here because there was a small context mismatch -- the patch
still applied but patchwork did not detect it.

        Arnd
