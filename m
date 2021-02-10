Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1EEC433E0
	for <soc@archiver.kernel.org>; Wed, 10 Feb 2021 17:18:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1D06464EA6; Wed, 10 Feb 2021 17:18:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D7F164E9C;
	Wed, 10 Feb 2021 17:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612977539;
	bh=69/9hUF8mlI6MctdAAk3WfH1nciXQnn6MkIE7gRdQts=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KSeaUhunui/AIRwCQ+3vjz8Cpt2aYM46X+B/b7LVemybS8n09G6AUtTTN11NiGqPL
	 xmWhNOAWb16sNjn7loBUU8dgCsOIIpg9J2cuVRP1My8lQAZSyoPUwqgVwWXotsQt2A
	 fZMfUWPszABwZLBMxvY+lsT2ro/RihnkmOG6dAMfjd8o3EH660Je6K0GygaTuY58Zp
	 wVgARtaZ2eKYU3l3T35iEfdx/Qtv8Ic/CXy2/tfp98SXCOH7vcPuydTJyfCRODmxve
	 HSGDtdMlEWXkT7oR2b/y74VwD4DfpZIHN2KKjerAZa30Gtk9aVsxBaCgG0n/ZxfSOV
	 Iukguo9J9JHWw==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 02/11] dt-bindings: arm: intel,keembay: limit the dtschema to root node
Date: Wed, 10 Feb 2021 18:18:14 +0100
Message-Id: <20210210171823.333802-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210171823.333802-1-krzk@kernel.org>
References: <20210210171823.333802-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check for the board compatible should be limited only to the root
node.  Any other nodes with such compatible are not part of this schema
and should not match.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/arm/intel,keembay.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/intel,keembay.yaml b/Documentation/devicetree/bindings/arm/intel,keembay.yaml
index 69cd30872928..107e686ab207 100644
--- a/Documentation/devicetree/bindings/arm/intel,keembay.yaml
+++ b/Documentation/devicetree/bindings/arm/intel,keembay.yaml
@@ -11,6 +11,8 @@ maintainers:
   - Daniele Alessandrelli <daniele.alessandrelli@intel.com>
 
 properties:
+  $nodename:
+    const: '/'
   compatible:
     items:
       - enum:
-- 
2.25.1

