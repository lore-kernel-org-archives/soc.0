Return-Path: <SRS0=npw6=TT=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079D8C433F5
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 08:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C9B84C340F5; Tue,  8 Mar 2022 08:43:46 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2FEC4C340EC;
	Tue,  8 Mar 2022 08:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2FEC4C340EC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id gb39so37482778ejc.1;
        Tue, 08 Mar 2022 00:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RxKlE600DjKjqdojxt+FivATkPbQP3ZK6Vj/OlWsxQ0=;
        b=b8MTlwrkatRq2vLJXcHuIzvuo7Jg2ihK8I9i8/Lg/fuOBjcjJsJ81ZcQ9XIu5phtmY
         uws1Y2OCYEQmqx/DICMwGu3MdIFXWR5JqHycZT3ifUG6wCozCqHZKDoo62ZhHyeQnalX
         v2ULCbHK52SEvl8VFfoIbU9rHLvXzY9/GbO60hCmtgFguU6TORNyOqPRixN+zZLm/jav
         W0JmO9wII2SZARZ43fPPEEbxck054vYL59H6u5Ic+RSJVU2hPLIO+D90HlTlILsOeSbr
         ikxJ6yKrxCdXhoSBCX3BdG6z6+c+Q7YCaRo0JXPEgF8Z0TC66kmfMoZ0dof+wpqIyXA3
         TaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RxKlE600DjKjqdojxt+FivATkPbQP3ZK6Vj/OlWsxQ0=;
        b=LnCpManR/00AvC55g4zf5vPjyEjYITzLms5B2fasYEeQbU997Go/an5paSBmTsHNwm
         YiofiSp2a0x1ppESRIx/+1Uw+Q8yvKIb2WHNfW2QkMwhSLPCRt3LWj8X10WgkUqAWoR8
         q1C4Gu6SiQUPwccFenLtvFpHM7zuSDWOa8s9IKLl2wv+iV2uKWr6SJPYFrq0LmW2w2R0
         20dUMKxqUp1se8myFTaH/4pQ+0hXiPpk5bxEVdyG/tuOUnQrLRQ/8jAntqg4po8EYd2l
         p6fL6edkrvzKCHIlxxSrvCGNsHM9JNh7AlCxRMwSu1QbYvkkE75J0cg2eknJtq17/K0C
         xqHg==
X-Gm-Message-State: AOAM5308ODPzxePox2EYSaJtzEMX5Jt+EnUhFLDlZOoUXQCJmzVUvsen
	Iukkz1BDSDMwShKxLeZYQGgHQbicM/M=
X-Google-Smtp-Source: ABdhPJxW4v0nChVyHeE8MtiIgLlsbfy+rFqKts2xGh9gUivBGZTf9oLhF0qJ+eTxKbHfZFGsdyJHNw==
X-Received: by 2002:a17:906:b102:b0:6db:1487:e73 with SMTP id u2-20020a170906b10200b006db14870e73mr8425587ejy.474.1646729024001;
        Tue, 08 Mar 2022 00:43:44 -0800 (PST)
Received: from localhost (p200300e41f032400f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f03:2400:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n25-20020aa7db59000000b00415965e9727sm7208071edt.18.2022.03.08.00.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 00:43:43 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: tegra: Device tree fixes for v5.17
Date: Tue,  8 Mar 2022 09:43:39 +0100
Message-Id: <20220308084339.2199400-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 8d3b01e0d4bb54368d73d0984466d72c2eeeac74:

  ARM: tegra: Move panels to AUX bus (2022-02-23 13:26:00 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.17-arm-dt-fixes-2

for you to fetch changes up to 7401b49c50c2b032223de408e28e37cbd63f4c97:

  ARM: tegra: Move Nyan FHD panels to AUX bus (2022-03-07 19:02:39 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree fixes for v5.17

One more patch to fix up eDP panels on Nyan FHD models.

----------------------------------------------------------------
Thierry Reding (1):
      ARM: tegra: Move Nyan FHD panels to AUX bus

 arch/arm/boot/dts/tegra124-nyan-big-fhd.dts | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)
