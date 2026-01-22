Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF47D33343B
	for <soc@lists.linux.dev>; Thu, 22 Jan 2026 18:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769107254; cv=none; b=dX+qvdrh78NUS0br4XeZ/3NU4Jtfit4KVvpmuXFOTmmNxIvRFy6RySmXBZXEzXlLPtvfgmPYLFU99e0SC4Y2HjaiFJ+NipXAQesW3wMTo8UxAjU6bMJiHxbihRHYKZ8AkaMu1n5d5VieF1T99YqgN98kj+Wkbt3I+xTUn8LySRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769107254; c=relaxed/simple;
	bh=+bey99AjgyNTqzkxXlw+Qjdw77mPPw1bmRZ8ASYrE0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n3F9qkeNQzyZLDnpyelm/UQLg52eRrbdU2G4IRCLf2uK+Xu/X4XQhJsJdDPue/IPt1vMBKpW4+Bh5YtEDMnKLfx5H29CuSP2ZTAwUV50O8asFuF2h3qWutthriOvdRCHRav1JCdQ8vRBKozlCNf3xnX0wqjDzwZTF1PW+B42ZnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=FQqDEKDh; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FQqDEKDh"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29f102b013fso10651305ad.2
        for <soc@lists.linux.dev>; Thu, 22 Jan 2026 10:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769107244; x=1769712044; darn=lists.linux.dev;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Kh3llz159zOHhYjpa3DZZY1B3AUjD9TXdEvBojqy5mg=;
        b=FQqDEKDhXJ3edBkGO+SqYeNRTYthsvAMeQicJqBwfMHLqL7Yp+LNbwFFKwPBWrAWcL
         sa3S1IqBZaOhj4bKK4bcoPYHTmHqs5gZoGhQ0lLnUi216ApiRVansjnIQ4QWusfbTYnf
         Q+fJzGofL1XhpkHKcsJIcilbXhU6LhB3kHsEaqZrgxnv1Krjv30ahP5yRZeVS9O58W5K
         wAVSedsIh02eVopf2IjklHOEVbaDiY6/aPSLsp9flL0nDBjqOG8JgsOGST+cMVy7gmm/
         za9UDHHpXQj8d6qI2wYJD1x5vg2jppyRKZZWy9RHSe5c3WTNld1+7wack/S78v0QB6ZZ
         ID6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769107244; x=1769712044;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kh3llz159zOHhYjpa3DZZY1B3AUjD9TXdEvBojqy5mg=;
        b=ip5G79MtxumGr4dn2cV3rBoaaXE6sDzeqK3LXxu02RVBFpOh6U5jcHGeOrY9lr7816
         c1Zm2qWIJt7aEPMqH0wdm/VW6bDPcsOwvg7IftiSny/Z7B29chCEeuQG7u5jgr0oO6/A
         AMFWqsXCoiH1W5s0Zs+MS+85f4QNiEekq5ZR277SftjC7Q0tftEs+4Ri20dbUUM3YeSB
         IBjQnZIPMtoBibLOsf2EKe+HA3gbzF+P+GKycfYvdk4s0LhCrsze891jOySHpMUSVebG
         t6zprLeExdOHpLRwsjTmJ5GQmV0NNZWQ0PkFi8ZCUisvNu60327B0wnUrYEmsGrjrtbN
         pRsA==
X-Gm-Message-State: AOJu0YwFLD1ACWLeSv1W1KvQa00sONsyNEJCGEYJP3SddM9GljGTozLB
	tRSR6CPi2UieekhOhJpzKKiEowGr7CkJZJyMJeDgc38DosYQ6brVY7D4S3gt8vecqzCmc0YaDja
	9uy4ki7U=
X-Gm-Gg: AZuq6aKJhcQQ5xGFCUHiN7CXR+c6Gz1u++e/yM6H1Hlg+2puhc2SE+g6A0TwENQ55hD
	77Hjw0sl2srPW2bUsh83RgHiD5Jp3ONJDzSd7yrlIyv3LnqSGaiKKIIGbrgruDjCG4N62ciuGFn
	SABebJPc3GG+WES9PjMp0xhMyGUGMP0IJeICn2rRNi7HdIsTwQubC+ZCB5lTwBTI08Dr/N5bB83
	5yb63HguYad/EwjVmQISG6shsFFMVIFi3r8QcdAfLbYMM1l4f7vE4MaKGknjBh+p3lzANJgYKQp
	duN+kpSi2ithJR+ujaPI7Jvi7QEIgjqCSAEudSafv3gnz9Y4AZ0vz7rsBRZNcc8oH1hPoE353JF
	g4Nkb5qOAsDTe6LMkCFMlg/XYE/g2JlLIlj/YaEcBNpoVeOW0VyPBNnha8AH5iHz0AcOVEzXTPr
	ZrLVTHxJv2
X-Received: by 2002:a17:902:e851:b0:29f:1bf:642a with SMTP id d9443c01a7336-2a7fe43ee93mr2949225ad.12.1769107243616;
        Thu, 22 Jan 2026 10:40:43 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7b03945c7sm52280935ad.102.2026.01.22.10.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 10:40:43 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: omap: soc updates for v6.20
Date: Thu, 22 Jan 2026 10:40:42 -0800
Message-ID: <7h343x7aol.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.20/soc-signed

for you to fetch changes up to dc717e24deb4e626f4ad4896dd722815ef32311a:

  ARM: omap1: drop unused Kconfig symbol (2026-01-05 12:11:02 -0800)

----------------------------------------------------------------
ARM: omap: soc updates for v6.20

----------------------------------------------------------------
Randy Dunlap (1):
      ARM: omap1: drop unused Kconfig symbol

Wentao Liang (1):
      ARM: omap2: Fix reference count leaks in omap_control_init()

 arch/arm/mach-omap1/Kconfig   |  1 -
 arch/arm/mach-omap2/control.c | 14 ++++++++++----
 2 files changed, 10 insertions(+), 5 deletions(-)
