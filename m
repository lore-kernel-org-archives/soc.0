Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71709C2E0
	for <soc@lists.linux.dev>; Sat, 15 Nov 2025 09:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763197257; cv=none; b=rdrJsXDm6iW/HB3QEPzYstmRmNfgUyRkz5mAKZTbKMka29edq1NE4c7NC2TD9cGwjfiDkLJxDXOZ5LEWXKyc3w1CA+TdsOw7NIpWPbcNdh4qpAgMxKnoHrZidxILcOt3ScWEWUf+usouKtEh4sZ76V4EdVFEXLGa9dXSmLNPiF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763197257; c=relaxed/simple;
	bh=4Lq/BDtaeJtbfXdVh5QgCiqIE8bUeV5zVhjBbFWgtQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NnNWGGiI7PfFTvNS87dvJSU3NRcw3czmkYRVf2Wz9oSsNiHspD50kWGlLoOvOKfx8i8sRLx26NbU5q0fBccSfA2fmIG4WewSoGF0r2YeRjXLrnnWQy1IjfjF7BIk0NOwUqXup5eaGx1aufFo5jc98ShIr42VgUxx/ZkMPlYoqQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aS4d7BDl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aS4d7BDl"
Received: by smtp.kernel.org (Postfix)
	id 2C83AC4CEF5; Sat, 15 Nov 2025 09:00:57 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F68AC19425
	for <soc@kernel.org>; Sat, 15 Nov 2025 09:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4F68AC19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4775ae77516so30040555e9.1
        for <soc@kernel.org>; Sat, 15 Nov 2025 01:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197254; x=1763802054; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6wDKFHjzRV7Jb9Tke0SbxVpJZc5zoZKHJ9dk74LvD0=;
        b=aS4d7BDl8MV+HB4EuR5IyLVSHmohNsxcE9LvBazGILJY9kSQTS4YlUoNIZ4NziUNHD
         xXvog+G5yiUlXJ0SbKWN1+ZEBgIjXvOb8u6abVak/ZTKz/n/HJdrF1LQWseqhCamowby
         7kIGeGQH5skIXwLvioo+FuU45YxQyk/uveocbDD0PmJZWhslzr5+VInmyLRJQRgSD/ab
         5Pq7wbre+yKl8qER66tK9BKRnrdXUHSU2bAr9OQkSJGjvjwcbbWJitrvLiQDXUDfVSdT
         E8WcqkQDI2f7s9gc3He5pTQl8kCOLKb4JyS2FPuUjwCKkGgeO+sup3C8NlT3GV409yZ5
         I+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197255; x=1763802055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d6wDKFHjzRV7Jb9Tke0SbxVpJZc5zoZKHJ9dk74LvD0=;
        b=eRPcm07UM90Q4jGGDRFpvZ2PAgC9Ks2TVosepYQgm5KDQEc897jljXNehFr2G9AiPR
         3JjMfFJM/OJ45qtNeEb1gpx1bPpKhIOfqgq1R9rwEddvdwtKJpiSMqmImY905eub1jc6
         l4I3maTi72tNWXH4QUkJOlUvedyrcTS3wI1+/YXmptoeYyS7qnivbpEdi2TjKE+imvZX
         eabtKLaL+2AAuC/JUwH5U7NLHPzHqbiHzPXXJs+l/DJT3rc73qtfmdkBrq0s4+dhKuYM
         gvplLmcR/Pgn/wlyfT2LlIlVsq/+QCijIoajDs8nOkwWViWynGFnRnx814e2J1cYfLpg
         iKyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwnGlc8G6oldl4oLarOGp+EDUpjksAigJjzwvSuStbBr+IPQkBVeuVwzQ3mGo4895Yw2U=@kernel.org
X-Gm-Message-State: AOJu0YzqqUome1U8OUfIer/W5gf3nnlwQeB9Rh4oqRmDY1bfexGWqs+/
	uf5m/7Ix4x7r0dFSAlG6AAVFAt4fGGFhZV/Z6mgZ/lSA5a9aTEGcXyVz
X-Gm-Gg: ASbGncu3OSYFey6FrSBCqZz5+SbZzxouCy7h2LxLRtnduCDh/PL+uHxEIX9fjeTZUm/
	fGD4eumuex3+vERaO6lJUU3HhAlP+PnF+ckmLct5UbP9od76MlBRoipM39ymzD8Lh7ASASJZZDE
	iZ8SeKbYWGWcZ79Sl2PrJXSVpXuKuQiMqyd9ZMmouzL8qWKABE0jqCMdpI4pv3eMfKcJviUoexB
	gZFDOGHUPb9rfu4snlzdWpW8LCDqw671SjhM9erhlkCl8MGfGcWs96W27Ei3h/6lXgynC/IsQ3T
	XaEhE8KTCLVb3eOtOzz6RzcfCd8nIp9QKLfyrHSoX3lvck5Dud+DR4tUWTg/0bEYIyqu4VfZxTu
	my6kH+OZms52n1WxFW8ATW7MTOIpgsMuhYE0i+SVFTJbFHXn9KT+W9ShDY8OA/9LYhtGRh9q96A
	xSPfe4EIbiWMZPTmWK5am8JS2mxoYTwGRBs6hBKTE3roH5q7o5K+ADoTL52nQAHHk4/KNLwdQG4
	HWJVvc=
X-Google-Smtp-Source: AGHT+IGbQ/s7KX7f/xqyB1QpfckUbUgWDGGjMrr2y1kPsnMSCp8R/Hg3hnEJQs9ahhQaY0z1VQA8wQ==
X-Received: by 2002:a05:600c:4685:b0:477:8b77:1575 with SMTP id 5b1f17b1804b1-4778fe5dcbfmr55442485e9.12.1763197254489;
        Sat, 15 Nov 2025 01:00:54 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b5ce849ddsm8331095f8f.14.2025.11.15.01.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:00:53 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/8] amba: Fixes for v6.19-rc1
Date: Sat, 15 Nov 2025 10:00:38 +0100
Message-ID: <20251115090044.3140331-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115090044.3140331-1-thierry.reding@gmail.com>
References: <20251115090044.3140331-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.19-core

for you to fetch changes up to 500e1368e46928f4b2259612dcabb6999afae2a6:

  amba: tegra-ahb: Fix device leak on SMMU enable (2025-11-14 17:49:12 +0100)

Thanks,
Thierry

----------------------------------------------------------------
amba: Fixes for v6.19-rc1

Fix a device leak. Could go into v6.18 as a fix, but since this problem
has existed for a long time and nobody has reported it before it doesn't
seem critical enough and sufficient to get it into 6.19 and then
backported.

----------------------------------------------------------------
Johan Hovold (1):
      amba: tegra-ahb: Fix device leak on SMMU enable

 drivers/amba/tegra-ahb.c | 1 +
 1 file changed, 1 insertion(+)
