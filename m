Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251C6207DE2
	for <soc@lists.linux.dev>; Mon, 25 Aug 2025 13:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.150.161.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756128340; cv=none; b=oP0vTvEVv4OptQtOR2bSx3bbVE3ZxheoVASl1at94Mpzz90cziSndtS1r1KG9/aR/aRH+LmFwmYYzjBlG/BtgfQMNFiJAU7xr+rfOwFk9Ic6a7823MwIKefI26HzjlOM3Dxk8lJuqAGgfEkf+B+SFadta3H73aeoysM0EJhPZY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756128340; c=relaxed/simple;
	bh=bgmM2Zs4MaGQXBFuvCCgN18B8VLoS/Ba6OvWoP3vue0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FsS5JvtQBWR8CC9pvWJ1NiKRFE8OfMjPApnquVA2BuAe8GDnJu7xdvED1A9Dlw00tpyxbYLyaXMeA9uewTih1x0Md9t+F28DMktfmnniY4LfIrWxfTmyo3/Kxzlzvg/m3V5hJEfDT9vdnevdRitET4LB55GaAnyef0kgrFfvkME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=T4AaPG+M; arc=none smtp.client-ip=216.150.161.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="T4AaPG+M"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=984; q=dns/txt;
  s=NAESA-Selector1; t=1756128339; x=1787664339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bgmM2Zs4MaGQXBFuvCCgN18B8VLoS/Ba6OvWoP3vue0=;
  b=T4AaPG+MH8YLMAEt62JkDk9hh4R4gKyo9b8Eif86kolZVOMHZ0Q4gW5m
   D53FT23R2UFy512kzVBeJAQYLJTYCUHr49e3xEXmDndYrjN54n/RaDnRT
   dH+pk9TheYFvQSqfKbgZDPbbpghRyIg4UvsEiwHP9HGd/8wurHu95IGMq
   /6OV3Z5474P8Eq5CeodEEb5Pmow4nJg0gE0XtIaDJ6UyktOBaEykzSB94
   u3XuubMhPkJPo8i4/9iIIgj4jlSWKbQfVql1UUvg1ABSMnJDkKg+llZ7X
   ZuA9T86hasQk2u9oXOGZbj1Kcz78sHKw9SyU7Uzbep6En5C0qbqMyRbUA
   w==;
X-CSE-ConnectionGUID: PtD6/71uSWqdeya4JiMSpw==
X-CSE-MsgGUID: MiaKSozETgiYROvZJ5KVlw==
X-IronPort-AV: E=Sophos;i="6.18,213,1751263200"; 
   d="scan'208";a="31949999"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa06out.arrow.com with ESMTP; 25 Aug 2025 07:24:29 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Mon, 25 Aug 2025 18:54:27 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: [PATCH v5 1/6] dt-bindings: riscv: Add SiFive P550 CPU compatible
Date: Mon, 25 Aug 2025 18:54:22 +0530
Message-Id: <20250825132427.1618089-2-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250825132427.1618089-1-pinkesh.vaghela@einfochips.com>
References: <20250825132427.1618089-1-pinkesh.vaghela@einfochips.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Aug 2025 13:24:27.0814 (UTC) FILETIME=[95132C60:01DC15C3]

From: Darshan Prajapati <darshan.prajapati@einfochips.com>

Update Documentation for supporting SiFive P550 based CPU

Signed-off-by: Darshan Prajapati <darshan.prajapati@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 1a0cf0702a45..153d0dac57fb 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -52,6 +52,7 @@ properties:
               - sifive,e5
               - sifive,e7
               - sifive,e71
+              - sifive,p550
               - sifive,rocket0
               - sifive,s7
               - sifive,u5
-- 
2.25.1

