Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49483806A9
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 21:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775078946; cv=none; b=L1ezW2s0dTdRC7ARjAbE2mh5GzdoZwL+8OufyMlBed+ejBqdwHgHhcTOLY+iv36BHX7Ctm+WQZ06MJ8urwlK719kJWiEG5iPijkOfiQczqScaPK3pvE5wf85AFdQShqirq811DxlTKKAmvyR7MPgzCaqiszfgh7id8PzOefnR+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775078946; c=relaxed/simple;
	bh=U/fUOSJSk4+rbP24lUBM6nBwRMa4PD4EWPaEofbYms0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hx8ErzNGIduOvVak4k4kxBbqTNhztBdqwYtqb94w1VlxOQ92ahN75NSP4rSI+nCgpDsxql9QJA3utdxxmIoqomBix5IiJHf7TJ6reXzNWyHRAIRJPvIaw4lJNDfkNg6rgJbGBES707cJBdrt+plhhPzOZpHxO95ZQtyBoiQ3Ba8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mRLsn9+x; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mRLsn9+x"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so45122a12.3
        for <soc@lists.linux.dev>; Wed, 01 Apr 2026 14:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1775078944; x=1775683744; darn=lists.linux.dev;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tA3CYuQv2XiQfD/33D614etMn9c8OW1fecXvIS0+Tb0=;
        b=mRLsn9+xvT3QC5JHYUzecBVtV6/nCTOPf4sH4+Rjc4NuXRtf3RqT/4NYPwVZSsT9PO
         rWvAhpXXlPChcFuxS07002KD2da2CzY7El88Vn+shznDJH1qrTP5/2N2yKDT8O5sUm0k
         IuNcK9db5HOM5uhsqG4dzy+4nCo3JILnSpLwak/S1XpIV1Y6qZjJMs9Qj6onMScCWdjz
         R3DaG58Azh/jnHrFacQzkqijfKPWGWVCEDaKWZ4cDCCh7/TxltQlXYJHKzhatNDg8m0R
         ZqhSb7ibw/R4xLgPTTaKgRSOAPcsPXPjmr0tVyOsWJFC+Ygs6ZQRPK1T99FSgXtthxqY
         D6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775078944; x=1775683744;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tA3CYuQv2XiQfD/33D614etMn9c8OW1fecXvIS0+Tb0=;
        b=Va3W7/wxkhP2bdNRNFkFiUFmjaQovfwT2cgS1x6fG5We7rx5L0K52PTgTarXL6KzxB
         rbyIInzriu/DK1WUV1YifM4l8eYwhNJ333rH7wjfzTT+5H0OnRVzNf4m2Uv8t+azLgT1
         iMHAKkyi30snhtT07UsfeyXoc2LPUUduMjJz+VfePFtaNQYask0hPupsWk4T3H1gycg/
         cIyoFmhxJTYsrbRA35McCqT5L+Z1eu9mQ254Pb2OcoCcQHgPB3GsoUqzCShclo2EeegP
         4VTjevRqy+d9WQLp4gUTD063afUtT4Eb52cQH/zCxKmGSn3o4QPLcBf/mT19EnJymJ1L
         oeig==
X-Gm-Message-State: AOJu0YwO8N35dKnIlmBLgAHfnXxbi2Llr8mhk8D40spnTqEgYt4ItRC1
	XjO6M3hFhx+j83e6qR76RiZVN8xRc1yB59N0gc6PxsED9oNRP4wbxiF2Vj5QELT6b2AmEcu8DKJ
	uerHvYLM=
X-Gm-Gg: ATEYQzzjAIng1v20bU+87DwLM4i7soIDbUQZLVLIzxLaH/wTBAdYSGvK5zpkBHRg7Zt
	6Q/wX/BL5IF/SKRRb1J45WbxWFOgX+viXsmwJhQMc/XUM46T8e5YlToDyW1Y1FB5eO38lrdeL8E
	NSZSBxzWdB6xkG4PrDbtBu28Ep7q5h//ak0djev7MWIrSQOGeuq30S4WfcgS+h7e2nOSMjoJrEr
	Q6P4hUWt26bDDw8+I7H4XX92Y8xn4kclTyLaQ19aJUvmyS+ZNMzf0MwK+f6G6aB9rSc8HqACQs5
	CckN9xtAA8gEAvjDqcp9IFkpIusikrsTwZbDNbRwP925KXLYxbBV7/T8YWUf+cYVUvbFedH+Wya
	wqWiIp5zG1zOxgrcAACa41T0PX0mlodg3+bSK97pKokzjzwcO+3ofSzZ/z4TeGK464FKaMzJLeO
	eWzAAC2x9E0A6vyeoci3M=
X-Received: by 2002:a05:6a20:734d:b0:39b:b35f:2eb5 with SMTP id adf61e73a8af0-39ef76c1b2emr5611986637.41.1775078943866;
        Wed, 01 Apr 2026 14:29:03 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c647792bsm822742a12.6.2026.04.01.14.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 14:29:03 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm: OMAP defconfig updates for v7.1
Date: Wed, 01 Apr 2026 14:29:03 -0700
Message-ID: <7hv7eatlnk.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.1/defconfig-signed

for you to fetch changes up to adcf290f9de2fc4768e5ba07c700e91faf9c86bf:

  arm: multi_v7_defconfig: Enable more OMAP 3/4 related configs (2026-03-05 16:45:57 -0800)

----------------------------------------------------------------
arm: OMAP defconfig updates for v7.1

----------------------------------------------------------------
Andreas Kemnade (1):
      arm: multi_v7_defconfig: Enable more OMAP 3/4 related configs

Kory Maincent (TI) (1):
      ARM: multi_v7_defconfig: omap2plus_defconfig: Enable ITE IT66121 driver

 arch/arm/configs/multi_v7_defconfig  | 28 ++++++++++++++++++++++++++++
 arch/arm/configs/omap2plus_defconfig |  1 +
 2 files changed, 29 insertions(+)
