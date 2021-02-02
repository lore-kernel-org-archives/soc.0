Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6230AC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 17:11:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ED7264E40
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 17:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ED7264E40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=swSnZKXpZ2qGpACulVe/880LDn6EbLt/q9KOSLynhgM=; b=p3aqubcX60cvuT9sUoeJfk+n/
	2u6Xs35rLnnS8TIfC5UFLSe/KGFLomKDd+2bN8SJANW3EI1pA60GeIgUtdg008JSciilAsCx0E+5J
	NUFx8IPNwGQ2QSuOe8mFpvv4libfeRv1CivBtXSCOB23ZvGXg1v47ATGpr6qPooEA3zurPrcGzTU0
	l9HP01pb9cQrta7eNEySTkSfkA1qR66N0izONIFWvLu3vosyeIRmkyaJYLonUmBcl5M0DQCPhFU7X
	88lHyZzJrsbG9INMCMc+jXcJ/Uoi0+V6ojeUuoEBQXbDuUSM607gnIJBaL1MwO/nfIwnXA5n/lCLU
	Etn647giA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6zCJ-0003A5-VW; Tue, 02 Feb 2021 17:10:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6zCC-000373-NE
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 17:10:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7AE764E08;
 Tue,  2 Feb 2021 17:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612285832;
 bh=ybDthzdFdusXcNHi8JLHA0d661hIwPmqgNAYeGAgYKM=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fNBt9SVwFYSOfJztnnL6gwSExdxitHL4kL37IGoIOPT0z4SHAHqfcjBjheVLWTOMU
 aVg6Uz0EoLRtgOeFvaO7lkltTqQtlJcm9/ZUv/u02vYV7GhoPtT5G8R6blpCw3bB1j
 SgYjOVNeSME8xUhp4RHWtHja/91AmW8dMmiSEPlN4KmfMT+2N35DwmGKbTzM4y0eGz
 9JHMFQdo535OMtTU8Q+UNbcbOEMoZr2R7v1Ccg2c9ASKUW1UGtLhQH47EUpO2F+Kmf
 wETzgScdAMAFJTIoBbduM9WoPThzlatStmS8ZJDpBi9roVbr1/BimiEppD6DBBQv0X
 etb58GHfUUU4g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, soc@kernel.org, arm@kernel.org
Subject: Re: [PATCH] ARM: dts: ux500: Add Flash LEDs to Samsung phones
Date: Tue,  2 Feb 2021 18:10:11 +0100
Message-ID: <161228552296.1852435.7133847671539908376.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210201091308.284465-1-linus.walleij@linaro.org>
References: <20210201091308.284465-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_121032_933722_672DF266 
X-CRM114-Status: UNSURE (   7.75  )
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
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210202171011.C9quPI9CzV841kqj7rG2jr3es7fLgKzqpx1voLoHQbA@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 1 Feb 2021 10:13:08 +0100, Linus Walleij wrote:
> This adds the Richtek RT8515 Flash LED to the Golden,
> Skomer and Janice device trees.

Applied to arm/dt, thanks!

[1/1] ARM: dts: ux500: Add Flash LEDs to Samsung phones
      commit: e9cb878ec238f85b81c7b439b4280062d4fbf9b8

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
