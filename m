Return-Path: <SRS0=xpWt=HN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66764C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Feb 2021 15:02:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 225D761490
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Feb 2021 15:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 225D761490
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZjHeTzABebu+PGc/nV83hHin2lC9/r1Z9nJ5ES0NFhU=; b=slnv1Ii8HwzWKgUx+Fr29mfRR
	k3ZCPs65qr7EUXtxR/+AwEyFnC90J95Obiz8NLcUvqH+ov58QjXBA4WlSMQqe5gCsCMXL8hLNiTsU
	KoNBK4Bl5uLXwGK2WH2n6N1yIbdVf+/CvlU+B/MDZA/CrFGRsZQpINLGYEgMs6cOsZGXLngAzV2Mz
	qXJlktc4uPt8pPm/p/693dlgWP3sayODNI3T3LrZ9ym9BxVheF7dAHNCFiTbLMYEcWsXISpD/G2ZK
	i8RXwtTKlQD5coCEdwJi3+OklTr0pDksaGnmZgbgxazxyh6ec1maAfG4j+fJ0zXUzkCV5YqeIED1Y
	ARhZwDrOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lADSx-0005Ie-C4; Thu, 11 Feb 2021 15:01:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lADSu-0005IA-UZ
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Feb 2021 15:01:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C24D664E8B;
 Thu, 11 Feb 2021 15:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613055668;
 bh=rqDDjK79OBgoldPyoYveemxer73pj+/BzsHfHnq+B+k=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pQ/+BRdpKgxwexLP3BGQbeHw9yLGaWQAi7fYG5MgCwPBMf13lfglgCNTuI6VZ+Dm0
 CHTBexu91SMibX4R0bJeGKCHNJuJqqh0ojHE/buz1jMySAdzw7YQ0DuW99JjTWF621
 /QvwyBbg3BUpgmJs7rdQ/AwyQFy2/9lnpJNXuUJZudXwIm5sAgy3JUhkiYP3dLILcr
 w3LRyzooHRQxgSh6whG3SWjnVfzBQwIsVcJs8Y2tNvbVXKQQWe8F3VP5/hdpOpDHZi
 9ApPH7+V2hl59HeDeNUIIV4o218iNTqSYlhG7fY3XRHlFtwodEiBIgiNrwGWjt5Fkb
 WrHOkq9Csps8g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 arm@kernel.org, soc@kernel.org, Olof Johansson <olof@lixom.net>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: arm: samsung: include S3C headers in
 platform entry
Date: Thu, 11 Feb 2021 16:01:01 +0100
Message-ID: <161305564871.259023.6054347017604811927.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210172303.335268-1-krzk@kernel.org>
References: <20210210172303.335268-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_100109_105657_DBE674E5 
X-CRM114-Status: UNSURE (   7.21  )
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
Cc: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210211150101.oN3TPfSOmWxjzZGW_famYaO3v7p1tumzWjaZET-Az8A@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 10 Feb 2021 18:23:03 +0100, Krzysztof Kozlowski wrote:
> Several S3C24xx/S3C64xx headers in include/linux are not caught by
> Samsung S3C/S5P/Exynos maintainer entry and might look like abandoned.
> Include them in "ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
> entry.

Applied to arm/soc, thanks!

[1/1] MAINTAINERS: arm: samsung: include S3C headers in platform entry
      commit: 36de760a5a90450bc1bd92b6938ce46f502da54d

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
