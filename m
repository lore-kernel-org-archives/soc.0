Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D9C1F7092
	for <soc@lists.linux.dev>; Wed, 12 Mar 2025 07:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741765247; cv=none; b=NLfs/4qU9jLZJJsHbIY8785JkQAXwj1P1gOGqOjNwOK/aIZs0dv012ZfWIPWLfxMoVimLgYQBAXxShnxEPBklvv7Z5cjgbOXOCN6c/dJj83ilNJtz44hZlSWKpb4pJKfqg5nWK+t6sMGSVESlLeqqP6/uK3hNQ0VndSewM5Z2WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741765247; c=relaxed/simple;
	bh=DEBfzBJ+3aotatap99JXA4AAYCmok3ICrUfF5HVCsDE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f1frAgDLOv/fa7fWBw/Gx9TiyAwCd6irYTKZuCp1YMJX37uIZESBS4vmpOPjQZBtTPkMcWrQHQezqmIkM4zxN8aza6HaIlaAThpeS2hnIk1X1396URS5stZk0QLN5LUGftAn/gmxu9rkzQVYaWAkwFsNkzZhKig1i+xTEnVVhIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Vco/OHRK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Vco/OHRK"
Received: by smtp.kernel.org (Postfix)
	id CDB46C4CEEA; Wed, 12 Mar 2025 07:40:46 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.kernel.org (Postfix) with ESMTP id 45F5AC4CEF0;
	Wed, 12 Mar 2025 07:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 45F5AC4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=fHft6
	4F3TLs6vn9uOrrKaF+BvY2zu4crhf+LJniOPRM=; b=Vco/OHRK4F0SUaFxW9hVm
	L+qHjuOrDoHUClKhNdIHZvmh+gzffM3DmcqOR2nySTlZmHK1Ueamg/RygfgXGVjx
	+K7oSqt65DsUs21dFZhcxOEweOBJ4szsVLcqAMWegLEf0/tvsXCinho29dX6hyQU
	Pte3ijui+erR6s1d589s4I=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAnwdRtOtFnQ6_FAA--.2767S4;
	Wed, 12 Mar 2025 15:40:31 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] i.MX dt-bindings changes for 6.15
Date: Wed, 12 Mar 2025 15:40:03 +0800
Message-Id: <20250312074005.663165-3-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312074005.663165-1-shawnguo2@yeah.net>
References: <20250312074005.663165-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Ms8vCgAnwdRtOtFnQ6_FAA--.2767S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ArW7WrW5ur45ZFy5uw17Jrb_yoW8GF1rpF
	nxCFnrGr1kJF1UJrnxtw1DAw18Xr17Aa17JF17Jw18Aas0yF1UXr1rtw1rury3JryxXF1S
	yF17Cr1DKw1UX37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jhpnPUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxcOZWfRB3jvOgAAsr

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.15

for you to fetch changes up to 401735c5f28f41561f60dc11b67520479694f422:

  dt-bindings: arm: fsl: Add VAR-SOM-MX6UL SoM and Concerto board (2025-03-11 11:35:54 +0800)

----------------------------------------------------------------
i.MX dt-bindings changes for 6.15:

- Add compatibles for Skov i.MX8MP variants, VAR-SOM-MX6UL SoM and
  Concerto, i.MX95 15x15 EVK, btt3 i.MX28
- Drop Toradex SOMs compatibles

----------------------------------------------------------------
Ahmad Fatoum (1):
      dt-bindings: arm: fsl: add more compatibles for Skov i.MX8MP variants

Antonin Godard (1):
      dt-bindings: arm: fsl: Add VAR-SOM-MX6UL SoM and Concerto board

Francesco Dolcini (1):
      dt-bindings: arm: fsl: drop usage of Toradex SOMs compatible alone

Frank Li (1):
      dt-bindings: arm: fsl: add i.MX95 15x15 EVK board

Lukasz Majewski (1):
      dt-bindings: arm: Document the btt3 i.MX28 based board

 Documentation/devicetree/bindings/arm/fsl.yaml | 27 +++++++++++---------------
 1 file changed, 11 insertions(+), 16 deletions(-)

