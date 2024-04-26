Return-Path: <SRS0=+HJT=L7=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC15C4345F
	for <soc@archiver.kernel.org>; Fri, 26 Apr 2024 18:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7E0D8C32781; Fri, 26 Apr 2024 18:05:33 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B236DC113CE;
	Fri, 26 Apr 2024 18:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B236DC113CE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41ba1ba55e8so5251585e9.1;
        Fri, 26 Apr 2024 11:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714154730; x=1714759530; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fizBVqhC4Ce5f9/iqh/ic074DoEbG4uaUF9d5i7O8Q=;
        b=EUGi3c8zPjsDl8P+eAd7KHI3WlvNqapejobc2BCT/Cp9dXEy5yZ7V/qrrYR+4ua3Ae
         Cc6kOQNDgjtf71EvtQzeJRDfZooB29FiNkugacc5qGbF1tCEoqBiYXCiGCl5I2k544Oo
         lNAwi7sk1XJ2SDywNGqM//5WNniGlyhLXsjQ8GgArno6ZnwSUV34/TLhboAhNrtzbWfc
         nOABocwVg/wS6qRtTAG0JaYP9oPvdGxAYB7KdRnhf0JNJL6Be8vmsaos1KzhddgqUW85
         OWiXGab8gb4tSFoS+rJY9SxWH33kAX0p4itfKw+2GJESQe6YuvT5VIIAVjJ44TT9GWbU
         4LMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714154730; x=1714759530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fizBVqhC4Ce5f9/iqh/ic074DoEbG4uaUF9d5i7O8Q=;
        b=p2dFLz3EpTlWqEVUqwaeN+Dt695p0QHEEuGMSRYnwssWlck8fieJsQv8PyUKEYtn5m
         kQM9HKZVlihTPuDDx9BTFeT5tvs4gK1WfrLh6VqY8wJAQbz0tm1vErMcPA0SgixMfwfM
         zG9wPSCS6bZ18f7R1+KWc/YfFZXcej3MmhAQ57aIc2xOa5AbWNlkSHKCvfbV3nKXwKfU
         6Kj9xLoBWGoldRA/ajei3/7ZTAZXNT9HsR0pZIh1IKOXVuZQWOXRXI/KrfShraiQ0W8G
         QWZFCHOiaNHpQl+Tp16B+m0GK9iMXD5M4q9w9VQYmw3aVpMh9c9Coxj8DhWP1tfs/sJH
         7Ofw==
X-Forwarded-Encrypted: i=1; AJvYcCW96qFm+q0yx5Ed6P9mnwI6sHiSbJLNk3t3KcHS01BCKuWCcRhH4keT5SdbdKvVtnnRqq7ExkyyhViKUcAQ0w==
X-Gm-Message-State: AOJu0YyxugjxmRqQVk7AlVPLhchWlvdVDsfpIrImwE36MSp/+EFt6a51
	Nppw/ROhLQg1ZZ3cbNoW597hyqOHHjlVLf5oB4qAPrXZdHxJOsfIdwHAEg==
X-Google-Smtp-Source: AGHT+IHumkVmwQ7zaIGDxs0JxQDFvR35S22xPS02xIpIwayE1JWqdPVB8NTTCdsIT+99zZdMNxXS1A==
X-Received: by 2002:a05:600c:a01:b0:419:d5cd:5ba with SMTP id z1-20020a05600c0a0100b00419d5cd05bamr2622446wmp.7.1714154729942;
        Fri, 26 Apr 2024 11:05:29 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c35c700b0041638a085d3sm35248233wmq.15.2024.04.26.11.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 11:05:28 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] arm64: tegra: Default configuration updates for v6.10-rc1
Date: Fri, 26 Apr 2024 20:05:18 +0200
Message-ID: <20240426180519.3972626-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240426180519.3972626-1-thierry.reding@gmail.com>
References: <20240426180519.3972626-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.10-arm64-defconfig

for you to fetch changes up to 4d4d3fe6b3cc2a0b2a334a08bb9c64ba1dcbbea4:

  arm64: defconfig: Enable Tegra Security Engine (2024-04-26 17:31:44 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration updates for v6.10-rc1

Enables the Security Engine driver for the corresponding devices found
on Tegra234.

----------------------------------------------------------------
Akhil R (1):
      arm64: defconfig: Enable Tegra Security Engine

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
