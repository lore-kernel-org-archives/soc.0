Return-Path: <SRS0=NGH2=F3=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE75CDB47E
	for <soc@archiver.kernel.org>; Fri, 13 Oct 2023 15:37:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6FC2EC433CA; Fri, 13 Oct 2023 15:37:29 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A08FFC433C8;
	Fri, 13 Oct 2023 15:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A08FFC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9ba1eb73c27so371451766b.3;
        Fri, 13 Oct 2023 08:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697211446; x=1697816246; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlsJKQ9o+97lJJY3AUNBW2W1fulutNe23lIectOvZKw=;
        b=aU697iWpmLLvQWc617mgTMB1zn9ZkrYg0I7jm6SUZXUKV7I9wTd04xsrWJ3Hc4zzpL
         yYG4ft8ZOfQA9VTCuVQPxR8usuOwQKRYD1ys0I7LhXQ/mo56wYPTn3+2/oC5SmCSQbSm
         k5vOvdgpQ8RnAQdTFkVNem0BrL7NyLnrOM7rCacvFVQA+UlRG5sGERhNbZNqWlFHwmqj
         qV6DH13KRlED8vFgCAmgP36NlCXtRUyfT5ULvNpCRYPOmmMy6Xmb77InyRDI/dqegJwC
         HLZsE9vgiEoYaEidNi4aNpCWgAQtE1LjnPHM4nad8VPc66Ai5y2XAJET2UROmhHMRoFY
         1qaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697211446; x=1697816246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlsJKQ9o+97lJJY3AUNBW2W1fulutNe23lIectOvZKw=;
        b=TnCUUCHbW7GZZmfRGGwidWzCz/TEQYm2GD1nHFz4oQo6xDrEIGVyIMHz8+1NAJRHgu
         p6rCXRHN0/AOub6JsooxU3UqNcIV8PMlgM7afuhXW0ZTciVAsb5LP26bP2LW+A+Vmod7
         V2NaQbMfKeW+2BlT+iZ/q/yv/a+8hdY5v9r2jUOv/LnatYv8dtrwKpQUYNUDImDjjfcp
         SjHG4JqdPCOxrAriqU1zF2Pc2wBb1XOm6YOgZtA69F9sl2pUwSHZSUNG5nTP6oGiRLHF
         FhDrzQMhr7yVdcQZI0dyp2fAnCXYfmwVuecIS5VJMfh+GdzMS8kEmxMHtVJ2ueSQmpi0
         k9aA==
X-Gm-Message-State: AOJu0YwgEa4jaEH/cY9rlLU7CYoiDzApO/l7parop1BqeyV288BHJroT
	OsDKfV3FyPWvkVvKfu+5e5UeqhWOShU=
X-Google-Smtp-Source: AGHT+IF3x8zmRFDMy3fLrl9T3QnLqwr20Q75vbxLig7CrswuqjzGa0s5PbKwgN0DhW2anpArJUF8jA==
X-Received: by 2002:a17:906:7394:b0:9ad:fb23:21d8 with SMTP id f20-20020a170906739400b009adfb2321d8mr23182490ejl.12.1697211446233;
        Fri, 13 Oct 2023 08:37:26 -0700 (PDT)
Received: from localhost (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id cw11-20020a170906c78b00b0099e12a49c8fsm12767358ejb.173.2023.10.13.08.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 08:37:25 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] firmware: tegra: Changes for v6.7-rc1
Date: Fri, 13 Oct 2023 17:37:18 +0200
Message-ID: <20231013153723.1729109-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231013153723.1729109-1-thierry.reding@gmail.com>
References: <20231013153723.1729109-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.7-firmware

for you to fetch changes up to ea608a01d4ee66f8b51070e623f9adb8684c0dd4:

  firmware: tegra: Add suspend hook and reset BPMP IPC early on resume (2023-10-13 14:20:27 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v6.7-rc1

Contains a typofix and a new mechanism to help fix an issue that can
seemingly hang the system during early resume.

----------------------------------------------------------------
Deming Wang (1):
      firmware: tegra: Fix a typo

Sumit Gupta (1):
      firmware: tegra: Add suspend hook and reset BPMP IPC early on resume

 drivers/firmware/tegra/bpmp.c | 30 ++++++++++++++++++++++++++++++
 include/soc/tegra/bpmp-abi.h  |  2 +-
 include/soc/tegra/bpmp.h      |  6 ++++++
 3 files changed, 37 insertions(+), 1 deletion(-)
