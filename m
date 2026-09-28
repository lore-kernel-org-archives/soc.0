Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E624418A29
	for <soc@lists.linux.dev>; Mon, 28 Sep 2026 17:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617181; cv=none; b=NHqQDAAMjCfwf3K/Imr3c/QASkKYLaqWIRhNkdfwUCUM25qJ+o2NpaV08wVEobEl3Cemz3pk/9LXiwv+WR9200IQGj2uZ4t1W9Wqm8elhXFCr76k+5uqHHNulJpRy39ccNa90EqP7WCy1LOqcW9YspF0e7DaPXZ2MBulFvhkBEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617181; c=relaxed/simple;
	bh=JyI1uQfKUkOzEB8Vx94OVELkLRvhB+A8B+iLp/uqpV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Km9eXbSSrUCo7v9QSao4jCXo6Cl889P3qniqPWiFpxE5B+XUHx2D0RSpCaF+EObaLdVIz4RyAuO4jRTlxmMxtsMialzfr3O/bIDdqltIyM6RoKqI9zMxTlCz3N2uojJ5Fvdm/HfYjuuJmPx1mU/mINWy/v/4e8WwfH/30cYLxWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=MYRt7ANd; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="MYRt7ANd"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-88206fc44c6so1818386b3a.2
        for <soc@lists.linux.dev>; Mon, 28 Sep 2026 10:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790617180; x=1791221980; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tHHkl+PrizyhmQl262VvRoaJ4qE1pvxLqUjujb+MLVc=;
        b=MYRt7ANdcUYgEiUbppI9nlwHqm6lDBKGEJGMTB3H9cwlpX6rHHLffnSXcRFrU4QyM0
         qbA/f3fZnWYX9nUdPrMqt7BYVKNjuYW+H4t6GbssYlhT5os+lt26HexhAMgek47hY6jf
         Popjp3uxChK55rz/npQpCxkW+eqNr9LzgVqlYfgwzpq7BFOeGc/wRtvSHRC1UWlHukbH
         nLAMnQhIsJwxBf4kjftZ70Fb0mPSogzDBu2owfI8J3ToiDwjNyzTpHgpyDJc2QvEI/26
         0Dp21Scdt6mfNAezZ2BbGRIQGUUtnxb+HNBnj5wSoPeOnggZ4H5K/Rdpzzmgmj1NyXw5
         mdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617180; x=1791221980;
        h=content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tHHkl+PrizyhmQl262VvRoaJ4qE1pvxLqUjujb+MLVc=;
        b=urhXjbxo9hpgnFrMzgfRJ/NrP4KRkkWpoDxa+QQLHOwPeSTfh4WzgzMUx3Dp62/quF
         3tbJJ6fKR7cQsjZ3qYyaDdN/EbUXDVm6FD+enhZG3mqW9oqQ9m68+bPUaPVakHlwuqv3
         3Bd3CSzfirg9ctgk+if1RlaghwmN+FWeXfpMeoorlZAOrTvOfg7zG1SdXnnF2sggKCfI
         h5ZLyvf4EaESz4UqR8V516K41buzYvlQ54a7JJy2+v7G8zX1WZMCZzvdopDeCZM7ikQ0
         wkUo+WwhtpX1UCayxqcz2KsVpZoPKDsiRAG+p8BPEuCuUclGn86DhaIcXYUz/Trh3yiI
         mjAA==
X-Gm-Message-State: AFuF++nVTlQ81EIjS0Mv+xBp+OfjAkM2TGLcr+m3Ldg5rwVU5cCK0BnQ
	xzQwSb837Jr0pQoSnrEFYM8G3NX5X3cGXwlELi1pP76lWJJ+p+q2bP7zGXkPcKGK/ssZTkdaBy+
	aufui
X-Gm-Gg: AYBFou36PRbDsoVLHymLCfjdd4PGSVumYbIxicmxm0pBxcIXjK2yZHeb735yI6PXTjL
	rkrYwfQIVvPTi2M0IidfMlScX0xIH/cy5QMFtreqTEj5dTTjAOmATYVhFHUPZAKA8w6SNcUrpUP
	JK5fPddNWAfACM8hDW47WJTHaTrj4swBqIHUXdLCdw/uci6YVM4fB51Ko3Sr/VL+5NqwZv2XuIO
	xt1ltOASIOPJTVcsWrTH8tXa4u85Ewikg4NNfHfF4gboXtPyKumrjDtUJcrO0nAk0Od3it4IXdU
	6Q5DGemwKjZODc4Rzdhqy/BlyTdT4LyxeKbLZ54yowf5dzjkHBBty1Z9cc3ssje1gY8pd4J748P
	buxk8ePEqTs10P20fNn6ae6JADReWbYAvbSYnO6ZE/XOkWB6/Jh0m7ySH2IESCFXLH8vc3mNcJi
	5/iDPvlH8vxRkk9ppnnOl+u+O2bLPRrzchd5Ux6HKyKBrp3SlrC5LBkUV6ubU2bB8Yyi8=
X-Received: by 2002:a05:6a00:a90:b0:882:359f:ef17 with SMTP id d2e1a72fcca58-88235a00258mr4914774b3a.12.1790617179575;
        Mon, 28 Sep 2026 10:39:39 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-87feb97e845sm4583378b3a.54.2026.09.28.10.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:39:39 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm: defconfig: OMAP related updates for v7.4
Date: Mon, 28 Sep 2026 10:39:38 -0700
Message-ID: <7htsn99sx1.fsf@baylibre.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.4/defconfig-signed

for you to fetch changes up to b45c06f362ee5ce9ef6402fcf57077a740cf1063:

  arm: multi_v7_defconfig: Enable SND_ALOOP (2026-08-31 11:09:59 -0700)

----------------------------------------------------------------
arm: defconfig: OMAP related updates for v7.4
- Enable SND_ALOOP (omap2plus, multi_v7)
- Support for compressed firmware (omap2plus)

----------------------------------------------------------------
Andreas Kemnade (1):
      ARM: omap2plus_defconfig: Support for compressed firmware

Sen Wang (2):
      ARM: omap2plus_defconfig: Enable SND_ALOOP
      arm: multi_v7_defconfig: Enable SND_ALOOP

 arch/arm/configs/multi_v7_defconfig  | 1 +
 arch/arm/configs/omap2plus_defconfig | 3 +++
 2 files changed, 4 insertions(+)
