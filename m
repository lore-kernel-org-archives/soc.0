Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C68B0C433E0
	for <soc@archiver.kernel.org>; Mon,  8 Mar 2021 16:22:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8A4C06521F; Mon,  8 Mar 2021 16:22:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9817765230;
	Mon,  8 Mar 2021 16:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615220559;
	bh=DaxqMrSjGTPKPAeSFo0wHloyqcDmzR3MPAXDd4mr7CY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DHAWb8216sL4pJA7s6bxkRegIiuTZ+aNXbN/0/reDIaybUnjnWAXOeP9S2XhKJjgQ
	 2B8+Ei/5D65nzYHbvu2/9Nlrq+GHit0wJdQ0ntogpnMrLz7N9sEooe+S/FpZFpP5A/
	 0p8oruIf4Gk9DGUZu+gDni6Sytx2SLXKIhpEYdfmd/+MYmWH4VttaFMZR6okJO4YMk
	 qXD1u/HpF4HN6C/ktSUkGCBjyFNgmmx++Ochpd80/lQaZwjQnoAAOcuw22kkZnqyfn
	 m/Q+Mv/36SP1K3pZzLZKVz/g06WGmiw2I2jaAw13jNKdCyMWNCrrE8urpa5fnBGbw1
	 vu67DAwLSHqxg==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: "Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND PATCH 01/10] dt-bindings: arm: intel,keembay: limit the dtschema to root node
Date: Mon,  8 Mar 2021 17:22:19 +0100
Message-Id: <20210308162228.62614-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308162228.62614-1-krzk@kernel.org>
References: <20210308162228.62614-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check for the board compatible should be limited only to the root
node.  Any other nodes with such compatible are not part of this schema
and should not match.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
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

