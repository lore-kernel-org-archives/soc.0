Return-Path: <SRS0=mpRk=HM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A123C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 17:20:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22C4D64EAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 17:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22C4D64EAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vCMn3lnTlVHDDKwce3FWzbbf9FcSXPZOhvhi+oQJzos=; b=H9azRo92+u9cOAaa7MiAAkiLE
	lPC0YtDk6yL92G893/vF8hyAPgWFdXEa3H3tbnlG3544a1r5UDekLlNtooZ0up4m8p+Ct4mKqpUH2
	eXlYAzHMQ5HnNDD7/w/XsaYgXpp7bWX9Z5GSXneHgGQwCDJBYivSoEYP6dGmixneRplw8tDMDl+kd
	Itvn6qryorALJGaAfOnWPadeaQxubuqAsm5GSenpMH2e8zNM1kiUouAkrMxA5dZTJ7f7pk3kkSYEp
	PUAafqbrexusIHPDEH+hZ39xWIOvjlYi3CUOPssGmQNOHgFfSmMbXk5CFLvBKUVpJh4xZzti1WQb7
	OJpBAqxcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9t8r-00083h-2o; Wed, 10 Feb 2021 17:19:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9t8l-00081k-NF
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Feb 2021 17:19:00 +0000
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, arm@kernel.org, soc@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Subject: [PATCH 02/11] dt-bindings: arm: intel,
 keembay: limit the dtschema to root node
Date: Wed, 10 Feb 2021 18:18:14 +0100
Message-ID: <20210210171823.333802-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210171823.333802-1-krzk@kernel.org>
References: <20210210171823.333802-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_121859_889692_B60466AB 
X-CRM114-Status: GOOD (  12.38  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210210171814.VX1OTozW6Dl2a-13GZe4dsj-432Xj6IW6RHZxDZLe4g@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
