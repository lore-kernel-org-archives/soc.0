Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CAB34887B
	for <soc@lists.linux.dev>; Mon, 28 Sep 2026 17:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617150; cv=none; b=ppGJMjmFnhKZwLOBd5SS3nr1tqYXm87hzc6VWd4cLC5JicUVKdmbz3opye7sG9KSNBuiav3Uv/2S+/vT9GKCuVuCkgtqL76qG0J7JatVOQR3CfEgD1NRXwJOzmqOP8+kQemzVjp8+sLxjAsE6XU3vCPSQPoDCoD5PtI4ZEhETfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617150; c=relaxed/simple;
	bh=g+4oTeY8QR1R4YLmG26YkV30pNEmlYAmrs8+WG8WE8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kPwlJfkJfajcBMI/pw62fv2o933Ws5i3ohTd94qz56QIs8Isdf4y5Z2R+4t8pOuKgadgco8gw55Ba4pnQk9g2xXoelSK4VlQCGnceSXoxp5Ag6a7nbFSdR2i4risZNSEiUC9Kafvc1FG6xtKZVWgjwi+9HXv7nsjkFbCAGPdoNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=IXj0g3a8; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="IXj0g3a8"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd4f99dso2178709a91.2
        for <soc@lists.linux.dev>; Mon, 28 Sep 2026 10:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790617148; x=1791221948; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KQcSNDmKTezvsQvsnROQYZUeQT8pZqDnSHqZSPctCj8=;
        b=IXj0g3a87E94c3kXjD12JbtSlHgHn7z/Pa1J+ySTFCx/dZkyO301zxBzsS6KCW+DTg
         FGB9MnOx9lNPH4GuRQcZTxbrhA24GrEW02+PX+J2r/i4CsB+povsJTC46+MRoRw6q6RA
         3WVVvVOyw5acA3zprQGUw+UPYuMBZ1LYIDhYij9cAkvoE+oLF9t3e7H8THt+uomcGwpE
         fBcfZJ77zBP/N1xlfapYV/R5CHjiE43tn4qi+k7ezYugOw2tps9prgl7XXAUfOtXKW6R
         ZxC/uAgLsKXCENbuHVt9DA90ZUvimjjKeHM/egfsPAG9Rxt5konE7REPoSFLDxOArMiF
         UK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617148; x=1791221948;
        h=content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KQcSNDmKTezvsQvsnROQYZUeQT8pZqDnSHqZSPctCj8=;
        b=pEB3IQmPHDV7DrpwIzYGoi/WzYjJe9Arj5dmKnWgDzvBHOiP50BUa4Vo3j05Ltw+Zu
         EpDia0JaOwt7EIs1kIjPsaRFhwCcTl+31ppd8jYXBmyuGh1h0Rxg0UemQPwjxNTnKfdn
         ShVhBkuKz8GqOFr55h4FheWd+xLQXQFcJc+Nu/Mw4HB6GSpSNyZx5H5p9fAhHqC78OU3
         7mFrOZJLfdOHFrMEjf0vbBpFZkmVNGgOplwf16di3RgKNf8ovqJTaPTFeFbYCJ9bhn9d
         MvOpY7fBe0MTBB7sWkyF1wT0wL7usbR++CJM/NO1wZZJcmfu4qGXnduns91uXFu1qYSa
         5vsw==
X-Gm-Message-State: AFq9FYL/4LzkZubD2yZJoZ4q5/x882ojUA8adItFrkNoproXND1fEDt6
	k+KZ1CLyZd9uULWel1XS8iltcmcfmoOrjAh7knkQP9p2m4POqSlt7yFYcDSQ9JthtoUlMZqqsJR
	HENWE
X-Gm-Gg: AYBFou2J7HaSMpFVOXZ/wxeZI6B+mZMbDC6j33OYSdGS4uXAkunNIzkXDYLk8+NkUrq
	vHfQ8W1t576ONwu976/k7WuxV9I6airEneBQLqgnNrO7k9a2P8O+9hZic5m8cbtLEdsN5/06XnG
	2Sf/aj5GtcmUdyDy/BWNLe5thJywa2AntVbPB5HTEnxZYT/dAvUw+qdizBu6P8B4bNXIrDTNRkk
	VdHuc2jpyiE2G2vGKRzmBoZaffde9oWugY1yyKdTrH3tOR2ksH+R/rEEDQ7yv0hcvf92GFCHgmU
	+cVAkzo/pVepo3ySzDBmNXmh21v3ulJyqmhqGV9ImYNRn9T24uPQk0fdv3IHIf+dkUmx03NoJ4i
	ffRsanBlm3lcCLuO+8PuVVDMeOVPLo4Ybm2FtlU4Zn3khPT05zscrISdW3f+yONSNNDJk7M6D2t
	K5+L3uf/YwbR4JQSeRJTom/3t5kLyBNFBEVQoA7aN6pJ/GfcNVBmrFt1rE9I+YnNYpAaA=
X-Received: by 2002:a17:90b:4b86:b0:3a0:ea9b:1e38 with SMTP id 98e67ed59e1d1-3a0ea9b31d0mr5816499a91.27.1790617148332;
        Mon, 28 Sep 2026 10:39:08 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3a4986e964asm515286a91.15.2026.09.28.10.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:39:07 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm: soc: OMAP fixes for v7.4
Date: Mon, 28 Sep 2026 10:39:07 -0700
Message-ID: <7hzex19sxw.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.4/soc-signed

for you to fetch changes up to d1e94aea2b15f076d3f95b309fbb372a8fe2e9f0:

  ARM: OMAP2+: remove unused ctrl_module_wkup_44xx.h header (2026-09-21 09:01:49 -0700)

----------------------------------------------------------------
arm: soc: OMAP fixes for v7.4
- remove unused ctrl_module_wkup_44xx.h header
- Replace __ASSEMBLY__ with __ASSEMBLER__

----------------------------------------------------------------
Ethan Nelson-Moore (1):
      ARM: OMAP2+: remove unused ctrl_module_wkup_44xx.h header

Thomas Huth (1):
      ARM: OMAP2+: Replace __ASSEMBLY__ with __ASSEMBLER__

 arch/arm/mach-omap2/control.h               |  8 ++++----
 arch/arm/mach-omap2/ctrl_module_wkup_44xx.h | 89 -----------------------------------------------------------------------------------------
 arch/arm/mach-omap2/soc.h                   |  4 ++--
 arch/arm/mach-omap2/sram.h                  |  4 ++--
 4 files changed, 8 insertions(+), 97 deletions(-)
 delete mode 100644 arch/arm/mach-omap2/ctrl_module_wkup_44xx.h
