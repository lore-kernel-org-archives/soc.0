Received: from mail-m49202.qiye.163.com (mail-m49202.qiye.163.com [45.254.49.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65BF137C52
	for <soc@lists.linux.dev>; Tue, 12 Aug 2025 12:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755001893; cv=none; b=JKo5XoxWKTQwxTaZwzAPK5L1jw/1IioSLsTDviGIV6Ic2Xeczfky6X+vHShxxNuPesICeZxLa90Jnz4+RjeYb/Kl3w9f3KWhSfuOwtiPI/9F/Gy54JoLVLwQfgBmkAfh8faJpQQI5ulutA1xb64npTVagIB4bK4LD4Jrg3pzjjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755001893; c=relaxed/simple;
	bh=5MxpdqgybmYCIkUxZBAHmRkcMHDnoAUJHldCT0aI7Sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aSlf23goJZQ2Ioa6Bv6Tb8rX080ceADODl4EZiSe62N2f4EJ7XMpAYovXvebV3ZdzqNa+bUB3GCENcC07BLlEmX0xf8o0cUjEw0WHCQ9Lu+ukxizFr8vrG5QqTxiFnTJ9p1IQWQ5jrAtFKchD1M4e2qJ/suGqdbCqR2q7tOAr5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=aXG6ZGLv; arc=none smtp.client-ip=45.254.49.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="aXG6ZGLv"
Received: from albert-OptiPlex-7080.. (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1f211b6c8;
	Tue, 12 Aug 2025 20:31:23 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: krzk@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	adrian.hunter@intel.com,
	robin.murphy@arm.com,
	ding.wang@bst.ai,
	gordon.ge@bst.ai
Cc: bst-upstream@bstai.top,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: [PATCH v3 1/8] dt-bindings: vendor-prefixes: Add Black Sesame Technologies Co., Ltd.
Date: Tue, 12 Aug 2025 20:31:03 +0800
Message-ID: <20250812123110.2090460-2-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250812123110.2090460-1-yangzh0906@thundersoft.com>
References: <20250812123110.2090460-1-yangzh0906@thundersoft.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a989e438b7209cckunm52c5de628442ec
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTkhIVk9MGE1CTBhOHhpNSFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=aXG6ZGLvgfa51rSTBlHiXg3xtd8dcVusATZ4pNvePrkUUSPb4nUavkAp1UfjzAAA9ubUQoFCl78X1otCU5YgBLROXuZzTtgcA3w3SFKwXVewCmlUMlQat6xquYEKG3uJEmjrx7LbD3pJaHlJDgkIrnm0mxY9vRgl74bHl0kcoyE=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=uMF9MVoCt3oNiVLaSeefyEyPgFYdHQbwhghyc6DPFLE=;
	h=date:mime-version:subject:message-id:from;

Black Sesame Technologies Co., Ltd.s a leading automotive-grade
computing SoC and SoC-based
intelligent vehicle solution provider. Link: https://bst.ai/.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
Changes for v3:
- No changes

Changes for v2:
- No changes
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6..3c2031417232 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -222,6 +222,8 @@ patternProperties:
     description: Shenzhen BigTree Tech Co., LTD
   "^bitmain,.*":
     description: Bitmain Technologies
+  "^bst,.*":
+    description: Black Sesame Technologies Co., Ltd.
   "^blaize,.*":
     description: Blaize, Inc.
   "^blutek,.*":
-- 
2.43.0

