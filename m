Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9914325C818
	for <soc@lists.linux.dev>; Sun, 11 May 2025 16:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746981578; cv=none; b=FkIC1B5oe7AQh6q0uoicj0gzVHSKBk+Btr/anki8rxrKXIg7ojETHl/JhPpqSu4lNNELSdC0JWqdcO00BwP+1np/Gu2oFFOk8IfmnsfHfeO1Gz1AcqBkpq/pNYn9i7Fc+rLLkdhUEjnozrG32UwpU6PtHmSWH9rmYOKyN1UuC+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746981578; c=relaxed/simple;
	bh=86EcoohZdp16Ev33iMEvnc2MOkgdGrvGGRvhH7b3g04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ufvTJ+Kp6N7A4Jpi+k2T9ggKXIfh3fDdTT7wfXal0RQeMEGg1QEqeXh8sevxkFBNvZlhOzXu1OO6dt5xVkOj56KEXSfCeCPUeWqBIGcenn7kUjVsNgGNxDVC9LvGpqWM40bkFoeuCubSXv5wff8lrIbfyMq2MqhPh9lKHArKvl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YhbSkvMU; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YhbSkvMU"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so4272952b3a.0
        for <soc@lists.linux.dev>; Sun, 11 May 2025 09:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746981575; x=1747586375; darn=lists.linux.dev;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MI3xhS9GS2tTohqa0CAozCWCbtZPg+ltklfeiJnzIyU=;
        b=YhbSkvMUE/HgldjRM6A/daHEC2eHvK9GpTU/EfmV2glOEf9E2DkwNDAKgRXVRvh/RU
         KoPqqOzEJ+o46bjijQgTB0tgwJe+a07XdX0bCBhTZnDt1JVjkUSPT7cr1vEB6HtgVJ8S
         Ma6TexZNe78FmoyxS/XAiEvyK+Om1OS9XqXgPZp+EWjt0DXGPrYZCd+AsMpN2Et1Xluu
         MkqcBTrkYJepNc3UsXF1Mm1pC3ZCqJASCqPuYqIjPM/WlfusdeY1KUz9ZXmIfSy+ZAuO
         cuJIGpXw8mLhQImJCiFbHy8DNvJW/y0NUuzfeXgPNR4ShYc52veCJTL8CZJvjBWZ9uP0
         yOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746981575; x=1747586375;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MI3xhS9GS2tTohqa0CAozCWCbtZPg+ltklfeiJnzIyU=;
        b=VR9KhTT9LcmWeSguLzW5UrtojEyp0PliMf9ifwY4uvaDX+JZjQogBEmU5Kh8z8phB1
         w/D9juorQEqEeAoJc5+p3P7VhzKKt447+AKzESa2kNr0iYlznpVhmVaMxRRc2SFb+sgg
         j5yP1dazVeVXTLZ494Hhny/D8YiotoUxYLezTkQBK8RqJEO6NXgLQp1XiO18TyzCxOzH
         T763wm3/a7WgcIDOBI81n91Gp8MX6neafwAo8xbwQAYfYBf2A1wi5/ffEEXS65dnaZMd
         yBLWSflmwJQ8dmGrQy7y3UPBCojzQh2gmnWHV5uzgkIE7cZTeK1ssq9pJKXp6pQcoGE3
         L3Ww==
X-Gm-Message-State: AOJu0YwNNgi51De+eicdm0YuTvy7EbaG4THGpABDuhGr8g9wckr/NXC/
	Yk8GF2fOvS8GBZCICYnTrOyAz0AspKU2VcB7+kv1YZFgbgAZjjvJeNBj0JpU69FxuhmvvoHuAcg
	u399ln2AF
X-Gm-Gg: ASbGncuVfEMqHvD2+9tHnTY8d2oVIa1RNLFL0kAKH3+fzltfCFgc1pOdKMJ/7NGFpck
	nuGn5glE9dQTiIk/r/qR1iFsX9aX1oETK4KDyTBIMSET3U77vBgiL4OKq2AZDVbfUZffQ0FaTlh
	XOIrjkVHmA1WubneLJUSmDlpxzGBkXWWi3xnqoXUBmYqJvLwuGxBWBGJrsYOJOKrQqNIvgNs2VJ
	VtD9bWVMU73i/RhM37b0iOglbmn4ewZjZtv/zOx4JqHzjj/e1nK9c3Md5fAdfHyIAmuXLE+YeIU
	ytUACQWHJeJaIMShr7/ggrcvASG+T6KrYxon5Rk4E7ERDJji6g==
X-Google-Smtp-Source: AGHT+IGLUaG3Kp3A5MVdotDg8riD1h1SCHLByx+6hUPHW+1j7xd73QRVyp0W55nwlfqH9cNKJFtzkA==
X-Received: by 2002:a05:6a20:d80a:b0:1f0:e2d0:fb65 with SMTP id adf61e73a8af0-215ab4ab9fbmr15814197637.2.1746981575693;
        Sun, 11 May 2025 09:39:35 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a8efa2sm4621595b3a.165.2025.05.11.09.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 09:39:35 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] OMAP driver updates for v6.16
Date: Sun, 11 May 2025 09:39:34 -0700
Message-ID: <7h5xi7rtix.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.16/drivers-signed

for you to fetch changes up to 36305857b1ead8f6ca033a913162ebc09bee0b43:

  Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg interconnect devices first" (2025-04-10 17:35:50 -0700)

----------------------------------------------------------------
OMAP driver updates for v6.16

----------------------------------------------------------------
Alexander Sverdlin (1):
      Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg interconnect devices first"

 drivers/bus/ti-sysc.c | 49 -------------------------------------------------
 1 file changed, 49 deletions(-)
