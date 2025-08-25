Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804A5EEBD
	for <soc@lists.linux.dev>; Mon, 25 Aug 2025 13:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.150.161.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756128343; cv=none; b=lFw8uAUaqb7kEyjDdcyAF9AxUSHYakfvYaD3x2IuABW7VAakWX7rUaaod24vJeJ74UOyY+31+dbdxLb0OpId/z4EAEatVt6cBpw9ozf1jRtx8Ie65Mzrd2gpwPZ3Bvy505pHPmxFkEZGoKvHgVO4IsXmMhwNmGMnS6X7OSRQgJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756128343; c=relaxed/simple;
	bh=bnrVDdhwgAXs9/wqHzUcqry2Br56Ejy1ctzZpmkn+/w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GLsSqBej7/IpPO/e07enrH0vhes31GJUe/MdwFD7d24nl2NUENm9TK3I/qRy4XIsbbHHhZWtasp7vYXed0j/8krjyOSf+icCUTNhrdCDbK0fZDo+KqmguR20f0ccDa7AKchY9awgTFzLsXhUqq/ZlMZJbR4XZ56Nvxa8PHPsXf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=WJr1v4bZ; arc=none smtp.client-ip=216.150.161.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="WJr1v4bZ"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=1119; q=dns/txt;
  s=NAESA-Selector1; t=1756128341; x=1787664341;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bnrVDdhwgAXs9/wqHzUcqry2Br56Ejy1ctzZpmkn+/w=;
  b=WJr1v4bZJusUzbVaoQYdNdXAbwfi/OoIvn5UypqDv+AwfD6KhYkmmhLM
   vR81i18BHvbb/L7XRjh618vSPSCW8yqEE37EjBDwVs2K7rBdOPhNkXXXX
   5l1MyIWvyotL1edlTH2fvzqXuunrSJfokEfgMFivJWm4xtX+24BjHQs44
   xU2ABDFDDb2r0RThzkcXjYs7dORQYpfsf/FulcNQYvWRlRPlemrQ/JiAW
   hQ07czUelaZBSbI0RZ6LfDaVvQZ+EbAapVdoO7+3YouGswUtICGBwI1Ma
   /C5sRUL3xcAZSAtv/LeEC/Al4CidTiRPfNifxHoRS9J7SZi5ZL8ZJNzzF
   w==;
X-CSE-ConnectionGUID: oyz1XfH6SjKiuCHBsVETnA==
X-CSE-MsgGUID: 2tvoRonEQJGhxEQfFrcKnQ==
X-IronPort-AV: E=Sophos;i="6.18,213,1751263200"; 
   d="scan'208";a="31950012"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa06out.arrow.com with ESMTP; 25 Aug 2025 07:24:33 -0600
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
Subject: [PATCH v5 4/6] dt-bindings: interrupt-controller: Add ESWIN EIC7700 PLIC
Date: Mon, 25 Aug 2025 18:54:25 +0530
Message-Id: <20250825132427.1618089-5-pinkesh.vaghela@einfochips.com>
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
X-OriginalArrivalTime: 25 Aug 2025 13:24:28.0050 (UTC) FILETIME=[95372F20:01DC15C3]

From: Darshan Prajapati <darshan.prajapati@einfochips.com>

Add compatible string for ESWIN EIC7700 PLIC.

Signed-off-by: Darshan Prajapati <darshan.prajapati@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 5b827bc24301..f683d696909b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -59,6 +59,7 @@ properties:
       - items:
           - enum:
               - canaan,k210-plic
+              - eswin,eic7700-plic
               - sifive,fu540-c000-plic
               - spacemit,k1-plic
               - starfive,jh7100-plic
-- 
2.25.1

