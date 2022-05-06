Return-Path: <SRS0=HH3A=VO=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3F3C433F5
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 14:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 44772C385A9; Fri,  6 May 2022 14:30:21 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 937C2C385A8;
	Fri,  6 May 2022 14:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 937C2C385A8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id v12so10249177wrv.10;
        Fri, 06 May 2022 07:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7E6fI/oP3TVn2/gg+vyC6SjczNcImpmXjf/EfX/EIEU=;
        b=jrBnnEH44+sf3d0rkVVd9mnlGM9qbcjsILZ3u+Sla956FHQw8v7gEsezyXGJcKEx3/
         uuSG6qLmkuiezON2AmP6n+845JHbxOlIWCVsCCLraUMb4lCw2Q/+9E33Y8p+OsvTfzkC
         mMogoEezH6hztQZKuaJWUMDhiRpVszZl/44VMbeNfAiV8jnsALo88kI45lc4zIXBLZZ2
         YPzv9XCX8GMaYUUAKSwdzzF2eeR7jFuotL1jAVCLuHDVP1OzxVSLIYelORAYwJ7x/jpW
         6XihXQo2baZsUws+M5iitOgKMXkx9sxJbU1xK9zj83smQa4PDGhHk05jnzqrpIozAfas
         PQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7E6fI/oP3TVn2/gg+vyC6SjczNcImpmXjf/EfX/EIEU=;
        b=qUZi1xrYO2lPYOCXxJh9QMFlzR2OEll6xmLd3tJAVGBaUnHbN7DDTfRz8pp1YV4+Nn
         TdQCBhOj4xTHtXa0XQSrp33k/nhBptSd90DgkorMimwO1yHPzdzDXxLNxihyCMVlbK6k
         p1OxMEYhhJ1yJdotFcC6x9JWWkOKprtKexzfmM8IMSOoPg3WboaurD7n67QuKPhd3PeN
         mS+6qxXPxfNmIfIuqY41P75IEfZtVqriv9ktvxLckLj2OG2nj8ChRNpm23GGM5RYZzpW
         46V6Lh2/biptIi1eNIL7D3Eq7zcEybGquJx61nqZhHn3hAugYlX4GktAx5IRTbKaTnwP
         HkxA==
X-Gm-Message-State: AOAM532GZOmG74uTU6FmbkJjf7I4ljSjDUbX2UkJhDLDSQjAKvB2RqYf
	5NqZjpX5bW1zsuH4UR04QcEtq0jU9f4=
X-Google-Smtp-Source: ABdhPJzeQuCsbxXOst3YKaO9hmwP2GvMrOstyLO3192slkVa8bsTI2oCXyZ8X2wlYUTbQHQFgYo78w==
X-Received: by 2002:a05:6000:1569:b0:20c:4ed4:4ba8 with SMTP id 9-20020a056000156900b0020c4ed44ba8mr2924448wrz.270.1651847418393;
        Fri, 06 May 2022 07:30:18 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id 66-20020a1c1945000000b003945cdd0d55sm4441422wmz.26.2022.05.06.07.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 07:30:17 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] arm64: tegra: Default configuration updates for v5.19-rc1
Date: Fri,  6 May 2022 16:30:05 +0200
Message-Id: <20220506143005.3916655-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220506143005.3916655-1-thierry.reding@gmail.com>
References: <20220506143005.3916655-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.19-arm64-defconfig

for you to fetch changes up to e46ab742195ae8760e03cb15fcf6f6a90fcad636:

  arm64: defconfig: Build Tegra ASRC module (2022-04-26 15:11:57 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration updates for v5.19-rc1

This enables the driver for the new ASRC audio block that is found on
Tegra186 and later.

----------------------------------------------------------------
Sameer Pujar (1):
      arm64: defconfig: Build Tegra ASRC module

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
