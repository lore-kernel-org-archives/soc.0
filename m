Return-Path: <SRS0=cfCK=XN=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E0AC433EF
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 18:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E4DFBC341CD; Fri,  8 Jul 2022 18:56:23 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 09882C341C0;
	Fri,  8 Jul 2022 18:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 09882C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id fd6so27891829edb.5;
        Fri, 08 Jul 2022 11:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uHrfk7LI7wY2eWl6J0xRT5eHLHw4uNlNuRzQ0IvUbyE=;
        b=K/+cHWyPKOwWnCgUBDrCKtOfztKwmz6zr5+8qhRQdrDTMTviQUnmXih9VGJzS9O4vp
         qGzx4Tz93t5CiCqIV+dCviH05TTkNr4QVfYTKCIIMNIE64wLHKLp7/UX/iXNUYZSnq1+
         NQz0t0ncHT0Z/Cs2Or56Qwd2bGqXb1zOesMMpqrRV5xsNya1aq0oT2iKAL2I/2PAEdl/
         YbzQvstxbZ/bJ1RIZDMsE1fbVuq7xab3W6mwJJjpqX7O3Zc0T91cNHnqPw+EjOrybWjN
         eUHmx4YNyVWjYRIM+LsD5eb0VhRKH2rFFUbqsGGYNQeWIo7kA3hvyi3r5fM+M9vTqXOl
         7qfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uHrfk7LI7wY2eWl6J0xRT5eHLHw4uNlNuRzQ0IvUbyE=;
        b=Y4SXqULaLmrL5+g0n9mu25TfqE3J6J7xvpK6LxzbTdFixqsYzlhQIt+2FDRVH6opUs
         lYnwjBdCSGl4KF+SpnymyEpT2EY/j37Hm7NybwIQYo+U0nriIp2LfQrwtZYi3UuVQ/2l
         GbqvBSAjRpxb50hWDM2HWVGABonfDM0ZzGBTtiziLBR++FU22tAwWYYEo0Ra0QUKduqu
         pymfpWqB0EbM8k8GQkmSQmVCq6mD53EFXHR90PqaTKYOu19M5kAAmFPP0VuxaMkCh5kW
         /2RJQvttZ7w1pHapMIYMxsTcHxyz4d5WSx8Q464wnDFiKKrJuGSqyakHHt5lgr18j5eu
         vZiA==
X-Gm-Message-State: AJIora/bFbruXxTwsTwFxwf7ebQIVH6mHN2xNIzS0ZK5bXWb5RFFhqXw
	7lbUF0N/X7OHNG4j/rON+Bhsir16Ad4=
X-Google-Smtp-Source: AGRyM1sjwLRosHhGfK5wYDGLNPyZvUj6pzH6TVgnH7fYGeh1AN0vwiwCZ8qJyeAB/u6zkz8MM0cfWA==
X-Received: by 2002:a05:6402:3907:b0:431:6776:64e7 with SMTP id fe7-20020a056402390700b00431677664e7mr6798242edb.0.1657306580905;
        Fri, 08 Jul 2022 11:56:20 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id v17-20020aa7dbd1000000b0043586bee560sm29912939edt.68.2022.07.08.11.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 11:56:20 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/7] ARM: tegra: Device tree changes for v5.20-rc1
Date: Fri,  8 Jul 2022 20:56:06 +0200
Message-Id: <20220708185608.676474-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708185608.676474-1-thierry.reding@gmail.com>
References: <20220708185608.676474-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.20-arm-dt

for you to fetch changes up to 799270e9b8be0846d418ed6c3f61408aef8059a1:

  ARM: tegra: Align gpio-keys node names with dtschema (2022-06-24 18:15:53 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.20-rc1

Two minor fixes to help reduce the noise from the DT validation tooling.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      ARM: tegra: Adjust whitespace around '='
      ARM: tegra: Align gpio-keys node names with dtschema

 arch/arm/boot/dts/tegra114-asus-tf701t.dts                |  8 ++++----
 arch/arm/boot/dts/tegra114-dalmore.dts                    |  8 ++++----
 arch/arm/boot/dts/tegra114-roth.dts                       |  6 +++---
 arch/arm/boot/dts/tegra114-tn7.dts                        |  6 +++---
 arch/arm/boot/dts/tegra124-apalis-eval.dts                |  2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts           |  2 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts                 |  2 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi                      |  4 ++--
 arch/arm/boot/dts/tegra124-venice2.dts                    |  2 +-
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts           | 10 +++++-----
 arch/arm/boot/dts/tegra20-asus-tf101.dts                  | 10 +++++-----
 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts             |  2 +-
 arch/arm/boot/dts/tegra20-colibri-iris.dts                |  2 +-
 arch/arm/boot/dts/tegra20-harmony.dts                     |  2 +-
 arch/arm/boot/dts/tegra20-paz00.dts                       |  2 +-
 arch/arm/boot/dts/tegra20-seaboard.dts                    |  4 ++--
 arch/arm/boot/dts/tegra20-trimslice.dts                   |  2 +-
 arch/arm/boot/dts/tegra20-ventana.dts                     |  2 +-
 arch/arm/boot/dts/tegra30-apalis-eval.dts                 |  2 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts            |  2 +-
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 14 +++++++-------
 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi        |  2 +-
 arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi    | 10 +++++-----
 arch/arm/boot/dts/tegra30-cardhu.dtsi                     |  6 +++---
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts             |  2 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi                    |  6 +++---
 arch/arm/boot/dts/tegra30-ouya.dts                        |  2 +-
 arch/arm/boot/dts/tegra30-pegatron-chagall.dts            | 10 +++++-----
 28 files changed, 66 insertions(+), 66 deletions(-)
