Return-Path: <SRS0=NGH2=F3=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AACCDB47E
	for <soc@archiver.kernel.org>; Fri, 13 Oct 2023 15:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 112F9C433CC; Fri, 13 Oct 2023 15:37:32 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2E638C433CA;
	Fri, 13 Oct 2023 15:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2E638C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9be1ee3dc86so26568966b.1;
        Fri, 13 Oct 2023 08:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697211449; x=1697816249; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zdk4NvJbSMGfd0BIaU/OwOTGoubjjFd1QVukVbebO28=;
        b=ZdnPu6UNou4WjnPBcSbazLSMp4g5Wtqx5dm3nUCV6Bj5puHQi69Ay+9Ai9EfmgoLQ0
         74Ch8Df4uHPmZaGRiMv+Td1295Du6ZK2H7hwCfHzsGd4Hj4n7dQ+g59fHbKc3TRvojyB
         AOBVLCObRuqZ7X7TRL6pe34t9CaqGQR+oyj7FAqGK2RA/QQrSx/74jFGCsJFT+9AlRV/
         /vutvRmZKsk6U7GTT8L9SCDYR2yTNwT5z/IIAgAqN1W4k4ptQqty/Z1Ji2L0vxX1P+tS
         WPIO344UA9197wY1MORWCcPun0OOkDKQenizpHtXs2VyIbyg2mPxLSpalAops/gEqhi8
         YFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697211449; x=1697816249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zdk4NvJbSMGfd0BIaU/OwOTGoubjjFd1QVukVbebO28=;
        b=ubAF+LBFdQzZnKZt8n7KziAvWc4o+qkAmj6x40FpXrVoneRlZirz3B13BobKfqRy08
         4BBBz0lq3+yyQqY2gwDVVl7tojvtnuUPf5/g5Rl1E67RfqwzxutiAVqfWNyXCqKvc7qy
         Xp2vVnSpTxP5/KK4BzH4Yq7f11teRMDK34KjcMLdgt4qOY8617CQHSvnxbtCWK6zhmsK
         lKGsLUFOi9vhNNFTvgd6fZlPKnxTUqb10VOT23P8+E6fNnDepUsvct5Hwl+WyMdtepde
         sXZ8iuDK9i5whp/PyDNEZgIf+ypvvCOlFl7wgw4Eut2ld2Hoe+nJVaMALhLc4A1LUnxp
         J2Yg==
X-Gm-Message-State: AOJu0YyCotP8mKerEFN+D2PVw0qbw76lmzz08hcKEJXONVZgDoUt9627
	1OAcEq2hpGazxT+DhVakaudpmqUZmmY=
X-Google-Smtp-Source: AGHT+IFYqC9tGqZnZhl1BWHxrEQ6EXrSviw9xGYIOiIjwt/Jf8wWQMwZrgXE4xHWoxXV8yVorBkenA==
X-Received: by 2002:a17:907:7d90:b0:9bd:fa48:83c5 with SMTP id oz16-20020a1709077d9000b009bdfa4883c5mr852294ejc.70.1697211448948;
        Fri, 13 Oct 2023 08:37:28 -0700 (PDT)
Received: from localhost (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ca9-20020a170906a3c900b009ae587ce128sm12513281ejb.216.2023.10.13.08.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 08:37:28 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] memory: tegra: Changes for v6.7-rc1
Date: Fri, 13 Oct 2023 17:37:20 +0200
Message-ID: <20231013153723.1729109-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231013153723.1729109-1-thierry.reding@gmail.com>
References: <20231013153723.1729109-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit ea608a01d4ee66f8b51070e623f9adb8684c0dd4:

  firmware: tegra: Add suspend hook and reset BPMP IPC early on resume (2023-10-13 14:20:27 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.7-memory

for you to fetch changes up to f344675a34383ae26a8230f4b1cd99cbd0defebd:

  memory: tegra: Set BPMP msg flags to reset IPC channels (2023-10-13 14:23:41 +0200)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v6.7-rc1

Contains a fix for a long timeout that can make it seems like the system
is hanging during early resume.

----------------------------------------------------------------
Thierry Reding (2):
      Merge branch 'for-6.7/firmware' into for-6.7/memory
      memory: tegra: Set BPMP msg flags to reset IPC channels

 drivers/memory/tegra/tegra234.c | 4 ++++
 1 file changed, 4 insertions(+)
