Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931FD340A6F
	for <soc@lists.linux.dev>; Mon,  3 Aug 2026 15:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785772253; cv=none; b=Ct9rTygQnrdT5f31z6FHJGL+wIU5p6JbKaV2wL2y7Wxpr25RnuFkkaFkz5H5pdorU2Ql7tQDDjv6CJFm7rWKYcJLGXr2OjgWFmGZZgmcsACkC8H8fFaZbmKcUnkkBQb04gaLKIT7XEpZ2LimdZ/1l6Miofc42/9iW5zN1EXT548=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785772253; c=relaxed/simple;
	bh=zBoJOy3aA0uyoB7z3ZtGuAXNBzCbibioJt6Be0moF+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WUb+tYZNnxyg769uXkVFFH9tuB6R1Ndl3RswLB6FepAgSodGI7BK5YOIBGM+/JcTHXB9f6AuXF7GuLBGyP22T30sibn9M0isvMwc0iiU30E0mLI7rASYbzCdriBcdGbu8NAZuw6csaoG/bKW9j8hmvXLA8kLALC8E92R1aKDTNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fhQLXwv/; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fhQLXwv/"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caed617615so47669715ad.3
        for <soc@lists.linux.dev>; Mon, 03 Aug 2026 08:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785772249; x=1786377049; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xejlBMo45WLuRAy/dsFHC7xCFuVwpUREVKu0zwhd9DY=;
        b=fhQLXwv/743xG1gQ8K290OPP+ZTC4GAdUSqT8XPdY6IrfZc9SXsLuXl6lhrGN9rEOx
         N8CvQQ2ixYtqGK/d2ox76ByA0M0VChy2ZxtcNPOPD+3mNFdDaswOZOvzgpEzCd5u27Gv
         W5NpeYejdoRHCvXT6LhOB+K72j+z/c6ge07E52XtyNEX7qMa8OH6z7NL9/sV5B61hivV
         kXHO0NBp4BDUNknI5spXZOBiT5LbzZjoBJSMjn8tL2hzg8K8za8ogJhip3eJDzlQ1VN9
         J+OH+/ziA8jT5TgdVkxFDV8fNz7NRLq/mRu7BDTrJhiPT14ODODzM/IXbWK5wD3ca+YL
         M1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785772249; x=1786377049;
        h=content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xejlBMo45WLuRAy/dsFHC7xCFuVwpUREVKu0zwhd9DY=;
        b=q0N0Iu/SHl2gQE+xW2tNlqU49LFguUICw1LIrejwAnkeUdCsJ+E9pKY8HZjza5KQ9L
         JcACNwrY1OnQKEBKFLj0mgmOE0wG9H6LhHUa2f9vPXLkf9bJWw9LSRqi/kgQSvqTUjRb
         lx9uDwzOZN55nSxclWh+i7v3afxapOzrfQ8tTbVmVFaNrxMmuuoqDyiInKmIe4qbQ8mk
         S3IQo7+bj8rBNODFN96tbhUYdU09O5a8cgOKC8ILemRePzkFzWRu5J5MbVG80FDrZSsu
         3Q04OTMyIY5nMRdZpUn/86R+RnLXBqAk0/VLlVbSE3ryDXp831nLV++jRRt9I2HW865t
         a+IA==
X-Gm-Message-State: AOJu0Yx+xxS0Y00ynLD//cEZKvYa3VcsC6ZfaLA+qg4kBF2qSFYMaeK3
	xpSvZbj+1gFGqAYrmdqJTGnb4Ey08j+8OZ3j921d9GjicW5SGqG19Daoj7cYMxmq+AhYuFrB8LU
	6QT0oiOwkEQ==
X-Gm-Gg: AR+sD11INisH2Pq7KI814EdhuDATIC0wAEnsScom/VosFftJtsGNEyHjhbkCGI+5eca
	A66EfzD4pcyIv3dNJ1DHQJ8GMvfuLi2a/Gkk7LMdZxAu5lLC+GsLqTWoizRdCAftonFqYGCQNZb
	CbfAqP6uOnCpAXqxsvWPMq032zWf17Q3mYi0wO5v9+s9ryAk9BLGoh2uiMK+1oSofP2b2vRPVvm
	GMmEYXM30I48A8RjvQm4+WVYVO8eaAjYelN/WUimELjERfYY3LK4Pv9BBQmUZlKvLDcDhadM3h0
	NTv67LA434MVtON0efbrB/eVx1WwxL76AXkwuY1ZR7NHzulAsq61b/koenHvuWP8p99QlvmHAxL
	tvJ/7QfcA/fHuyJCUVbdcLqUjJzH0/jpDH2hzzwdNSAvti6wOJ1cJNfizRQQdxn/7y2EcPeFOdf
	1IEik3Vn/dNyxqxMlfsxZqasyAtkGWVKlrwNS07AdgJP2RwgpGhHBeEZSoFQ==
X-Received: by 2002:a17:902:e543:b0:2ca:329:3da1 with SMTP id d9443c01a7336-2d052215bb2mr105382375ad.16.1785772248620;
        Mon, 03 Aug 2026 08:50:48 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2d04b0ea863sm39573495ad.38.2026.08.03.08.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:50:48 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm/omap: defconfig updates for v7.3
Date: Mon, 03 Aug 2026 08:50:47 -0700
Message-ID: <7hh5lbjj8o.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.3/defconfig-signed

for you to fetch changes up to d091917c23668cebb0ad23b18f5a9f6665150054:

  arm: omap2plus_defconfig: Enable multi-LED (2026-07-06 11:41:09 -0700)

----------------------------------------------------------------
arm/omap: defconfig updates for v7.3
- omap2plus_defconfig: Enable multi-LED
- omap2plus_defconfig: enable things required by iwd
- multi_v7_defconfig: Enable BRIDGE and DP83848_PHY for TI AM57xx, AM437x and AM335x

----------------------------------------------------------------
Andreas Kemnade (2):
      ARM: omap2plus_defconfig: enable things required by iwd
      arm: omap2plus_defconfig: Enable multi-LED

Parvathi Pudi (1):
      arm: multi_v7_defconfig: Enable BRIDGE and DP83848_PHY for TI AM57xx, AM437x and AM335x

 arch/arm/configs/multi_v7_defconfig  |  2 ++
 arch/arm/configs/omap2plus_defconfig | 13 +++++++++++++
 2 files changed, 15 insertions(+)
