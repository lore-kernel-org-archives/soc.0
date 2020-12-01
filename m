Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0CB6C64E7A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 21:16:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CE8820705
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 21:16:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MebRzmzR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cl5xf5af"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CE8820705
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OCJDsfC02WkVr/IK6YU/hb639ZtsfAC77OHjChQqgJg=; b=MebRzmzRi3tGpTJcZnhQiczZVy
	dG3HmaC7Zsnl15Zh5P0QoHF/J8dwjZFxAXz+Icgb2dFHeyJRkQJXMeqrIbaTfM6jHlQ9Pf5tgKy7Y
	4NvBumEoH6k8hrrN3Wpi8H1Hel75fBSwx3alGxo3byLRYvE6izsFGZ8XbA56d4rcBEIE+wpBJVXTn
	sZyx4/DPlv8oosyI3TcNXdWGod7IknOkf3rYJho+yjHaY/w5YQ67GHgSQIsZF9nVK6mPEq85Wfoky
	IH8ruAAK7dKCmqGzwjdXHyHQp9yaj1qCD6CovyqdHXMFM2rHU8Bc4+6PLdx4nFhbdN8FH5P98qiyM
	0W/j+VZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkCzs-0002sn-95; Tue, 01 Dec 2020 21:15:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkCzq-0002sH-Ik
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 21:15:39 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 55AA120671;
 Tue,  1 Dec 2020 21:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606857337;
 bh=znM/sTQPgIAnxhrBqsvxKIzLB8RNYZUrv6AQid0YBZQ=;
 h=From:List-Id:To:Cc:Subject:Date:From;
 b=cl5xf5afXi5De5TWKaA6eevuRBy+iJitYOpl9/kq6F6qNZPOS/spdN10eXc+X/4QH
 MhkJtS2pDj2SYWu2Ou77X9HEs1GiUzHd2DeFVB98NgSWBI5bz10jD35iZXo8VYmihJ
 tfuW4tB+yQhU+WRN18DGuOcUebMnm0fJl9PqKf38=
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [RFC 1/2] MAINTAINERS: correct SoC Git address (formerly: arm-soc)
Date: Tue,  1 Dec 2020 23:15:15 +0200
Message-ID: <20201201211516.24921-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_161538_796675_2AE8E2F4 
X-CRM114-Status: GOOD (  14.24  )
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, arm@kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201201211515.vB6FHb9W2pJzodszTOW38BILbIgHu1LdnJSWuMj17z8@z>

The SoC Git was moved from arm/arm-soc.git to soc/soc.git.  Correct the
ARM Sub-architectures entry.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9b4a53cbf43d..6149066a545e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1494,7 +1494,7 @@ F:	drivers/iommu/io-pgtable-arm*
 ARM SUB-ARCHITECTURES
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 F:	arch/arm/mach-*/
 F:	arch/arm/plat-*/
 
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
