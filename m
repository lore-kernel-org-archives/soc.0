Return-Path: <SRS0=2LUn=GY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D707C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 03:43:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36A042389B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 03:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36A042389B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=v3.sk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g+tJwDqq8igfrEXAivpU3I23ndHTzsM32INFXfbjN9E=; b=qCPIi9tQR2ZLwFL+31qpIKsMCq
	tM6Ms2xE02bSIC21c60CJ4V7o9f52rHKgoc2hliMHQQLMltW5llaXc8HIsO6zs0weuwVcNXA6tE/x
	LCq9RIx9yESJC0zM5Yd/PgMTQEfRhMfdo+WbRpwjZFkHdE/ty+enMjyxmnp8aejJYXSurKX+07Xf2
	5eVZT1YwijKrmfLB2rEhzLdW98SxAur+4wq09nG33UxSOccrw6ahSHSDpQXuKQv8nzGfj398HVC7t
	28e8ZdhtkbAjjAOi5sqiRp0btRnBJDJ4bKMny7mm/jcT3sz2dvB5seuc/QWVkX7kQM0vIz5DknuJj
	OwkkJ9Vw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Qqu-00068n-9T; Thu, 21 Jan 2021 03:41:44 +0000
Received: from mail.v3.sk ([167.172.186.51] helo=shell.v3.sk)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Qqo-000650-Gy
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Jan 2021 03:41:39 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 92DB5DFAD7;
 Thu, 21 Jan 2021 03:37:38 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 57lrcOM8xFDU; Thu, 21 Jan 2021 03:37:38 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 4A77CDF8E6;
 Thu, 21 Jan 2021 03:37:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id L9AaxwMXUBPt; Thu, 21 Jan 2021 03:37:37 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 6D2E9DF892;
 Thu, 21 Jan 2021 03:37:37 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Subject: ARM: dts: mmp devicetree updates
Date: Thu, 21 Jan 2021 04:41:18 +0100
Message-ID: <20210121034130.1381872-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_224138_700175_28E92FF8 
X-CRM114-Status: UNSURE (   5.12  )
X-CRM114-Notice: Please train this message.
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
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210121034118.Kf0bClY2ra64JPR8Tkbe4PvdaCTFEIhuZ4ChgPlng-c@z>

Hi,

chained to this message is a handful of patches related to MMP device
trees and bindings. Please take a look and consider queueing them for
for 5.12.

Thank you
Lubo



_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
