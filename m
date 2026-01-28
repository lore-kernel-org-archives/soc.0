Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B4626B95B
	for <soc@lists.linux.dev>; Wed, 28 Jan 2026 19:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769630214; cv=none; b=I4RGrVmD2rQvjwpJM9w4ft2gPKr2HY09MA4o7yKimrBC7zhPbAKQJfvqn37xMXysNtN7A6z/UAk2ToaEx2iWw1Wnl5x9W/21IrfGlJNthEnaJQ+w2NZE6g1gNuDGDk+bLVobT2Mr9FTkuuSxFWdRiKzfxAZdh6/2Q2l7upIXArc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769630214; c=relaxed/simple;
	bh=s9evt3/0RZOpoqnYeGlTHyaG+mjdTuEQP+ke1/vYM/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sUhMTF2Z2i/Hp1mMWKZPBI73zqA1PRGc/HDJ7YpntfsXTxjd5joWm1dOnSXzlWpg0CZj26IcMK6bMB4kv6qk2cCfavQK3oRR98aZoHTwAtesN286s6agGeQ+kJg2wLCuvHtBQ7Yf7hgr1FoOhGykvwqd+CXmvXcp7tCmA1FxbPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahkk1Sbk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahkk1Sbk"
Received: by smtp.kernel.org (Postfix)
	id 5C3A6C16AAE; Wed, 28 Jan 2026 19:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C509C4CEF1;
	Wed, 28 Jan 2026 19:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769630214;
	bh=s9evt3/0RZOpoqnYeGlTHyaG+mjdTuEQP+ke1/vYM/o=;
	h=From:To:Cc:Subject:Date:From;
	b=ahkk1SbkQoZcm++F+jUVGjhjrBTbvc/XCIrlejld+Fmg60uuPLSu9qt2ZWCU41zOz
	 UGMAo/gwmghVKbKEa7CA7S1hFWFDGs7DcZrIGCjQ3vspyLgCmWyL5OfMF1sy+vqaEk
	 mwBT8wWPJZ9yQ+0EKyD7I9v/wbvNU4hK32fP7ABxMfk/V4AQalt9ahy4HLn2WUY3UY
	 P1aI6ibTHqegs//8gvq66Eyx9V6cmMaSSodmzdFUM5iP9EbwkWDNchxgO8wzVEUaDA
	 emn6Em6GNHsl2vqXR7Nrz06GYm9yyetoXxgRk+VVM5fkLPveC8/Wuv/NycGe6I0QBf
	 wx5di5fRcX+9g==
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org,
	Yushan Wang <wangyushan12@huawei.com>,
	linux-kernel@vger.kernel.org,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH] MAINTAINERS: Add myself as maintainer of hisi_soc_hha
Date: Wed, 28 Jan 2026 19:56:31 +0000
Message-ID: <20260128-audition-professed-31d1b66d5b4e@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=962; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=yMkcBVyTqj9wH0QBKUGmwYVHoKcAFyfrd+ir0zTY+XI=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlVme8i500UbBOpX7tJ5tPdeH7pBz1G7NJVl7kbbnYdu HD5ad+GjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExkzSVGhpnH36YzavwJXZ5i pGf3PsqBsXzabiuN5D+SrQuq30a4zWFk2Hzvlcu0OaZPzadwHNHobOG0PXR4ZZtjHatOj1rl1xl 3uQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Yushan Wang <wangyushan12@huawei.com>

Add myself as maintainer of HiSilicon SoC HHA driver as I will be
responsible for this driver.

Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

soc folks, I only have this in my cache branch so I am sending it as a
standalone patch.

Cheers,
Conor.

 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..1c14a7cfb197 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11366,6 +11366,11 @@ F:	Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
 F:	drivers/soc/hisilicon/kunpeng_hccs.c
 F:	drivers/soc/hisilicon/kunpeng_hccs.h
 
+HISILICON SOC HHA DRIVER
+M:	Yushan Wang <wangyushan12@huawei.com>
+S:	Maintained
+F:	drivers/cache/hisi_soc_hha.c
+
 HISILICON LPC BUS DRIVER
 M:	Jay Fang <f.fangjian@huawei.com>
 S:	Maintained
-- 
2.51.0

