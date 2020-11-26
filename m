Return-Path: <SRS0=esR3=FA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C726EC6379D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2020 21:19:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74D5A21D93
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2020 21:19:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qdRlssPV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UR26oyB+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74D5A21D93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=htwYw20dlp1Dkm0iLf8fdF5Ea3kSGubglkAcsIsbUIg=; b=qdRlssPVgTzygbgHY/tj8wjWI
	OSQ1jc5e0Iw9i2IoiCvZ12ROceGBs2UxkL1C+ZN5rR040QXdMAGEG5j4sO/sRSCkVGgYp8GqjC0jq
	Mfetq5O/q/qJ7ReLXtug4y9oc+oU86sUy9IQjlS/FxAHZ91I/qyeOU7zBvX8W6dmf5avwfdBRYcxx
	AXL4MGyzWz+EiwqvdE5RJBdlN/H+KDxlXYAGbRrxAnsEiYCaX7z6lt1dCNlw4VL296gIvnZTDwlXG
	M7Zj/2y1wGBgA5tZnxspN3kNC5UBRjRIykj/PsLMlImGOMN/IL+U2sc7QtDPJgsL3m7COWI3Lmqod
	JTM5a7JzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiOdq-0005jt-FE; Thu, 26 Nov 2020 21:17:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiOdk-0005hl-ON
 for linux-arm-kernel@lists.infradead.org; Thu, 26 Nov 2020 21:17:22 +0000
Received: from threadripper.lan
 (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0DA1221D1A;
 Thu, 26 Nov 2020 21:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606425438;
 bh=u7BH5L4eK0u62SL9mIlU3zK5mJXaMoRqQvowEE7Quls=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UR26oyB+rjFuzsCB2vcev8xkFrFECltLmcIUPDjwfTjs3Chh7QeRifrAJcigQFaBd
 h9VcssTNMYZwZzI/8jHEj4BOnJaLNNVxU0EXLLrZtXW1/E9xuTr1OqcxUaKx4RrYL/
 9GJ/cH+MoMW6LMp9dPUTTc1N2ryhFNu0JEZf4EaE=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Li Yang <leoyang.li@nxp.com>,
	arm@kernel.org
Subject: Re: [GIT PULL] soc/fsl driver fix for 5.10
Date: Thu, 26 Nov 2020 22:17:11 +0100
Message-ID: <160642540713.1426580.10622135995409567904.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201125165922.15487-1-leoyang.li@nxp.com>
References: <20201125165922.15487-1-leoyang.li@nxp.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_161721_228345_2B0D93FF 
X-CRM114-Status: GOOD (  11.91  )
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
Cc: shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201126211711.11sjqDhly0cA9jQaIp9313k0-etqfhHcbgSpYXs_z9c@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 25 Nov 2020 10:59:22 -0600, Li Yang wrote:
> Please find the pull request for NXP/FSL SoC drivers.
> 
> Regards,
> Leo
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 3a18293e4a0fa75366087c683bb959a8ff55111b

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
