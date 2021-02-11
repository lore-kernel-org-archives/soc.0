Return-Path: <SRS0=xpWt=HN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD65C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Feb 2021 15:05:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2529164F0B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Feb 2021 15:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2529164F0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IJrUOiT9yp+GvIYFFyYzYEd2vCmmkzwFuLnQSZfRTCY=; b=0db5ffOinqVwakSfTBug+9c0Z
	eAruyZ0H92AfVIU7oGF2ng2/NWh7+VAAPjYTct71M9WjRsI/5ubi90Xq1zJC+lFw45ogcWQT3ulU6
	qyNGH5R0ljEWjXtoytlh9ohuo+2dkeaXVjA33Coa/7MY5l4LAEh1vdNtFDslJGLIpCy7QODAnA4Jz
	HklU5Y7StaFozqtdiJAXQbedJ7Ey7cZgUhWMf2uwKKCiuospDqFa1hUs/PTfBpUlopmLeR1Gai4BN
	26j3arXe1fGb0yiQUkj/bUrzHo47D4EyX0Avs/Kbk6lYw3hbDr4J6fvaqykaXRmYRb7BUe2w1YCR5
	uoXXReuGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lADWJ-0005oc-Ij; Thu, 11 Feb 2021 15:04:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lADWB-0005mt-A9
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Feb 2021 15:04:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B86D64EF2;
 Thu, 11 Feb 2021 15:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613055870;
 bh=pmdjBKNJSsKY1j7IbCMcNKQl56g5BR2fFy0ONv3b0Fo=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qFOM49bK78dgQiRWsHLE5DQvV1bd1meTG08dWzpN3zWC6TchOIiddzNTx0Sd4BI3v
 fCwTFWWA7fmEgm8z50FczvOKpTi232i04j2BhAjQu7t5ndXCylkrMZ9VdPKaoWBRtD
 7X+cHYvvI5woQq+0g+Gtj0dFU583n9jIQV0KzaN9Gy/tzJDu29/WjdApAg7esOXy9+
 QBeDREJ4O6O0V8mpT9vPeO8uwP94EPBn95GOkRVjIk0Tv7IUwCDL5gwdQBoQa8Vnnw
 LV4s7fdX2IhpHbvAmDK+U6ExhFE6JiE8vsLt+jSXyKKuDdaGATL8iVdjSASMg5IC1b
 Wmqj8DeqCb5Mg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, olof@lixom.net,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: Re: [GIT PULL] ARM: Visconti: device tree changes for 5.12
Date: Thu, 11 Feb 2021 16:04:22 +0100
Message-ID: <161305573916.259289.1286171955086418832.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210173210.nnytfyrkkj6ylrtb@toshiba.co.jp>
References: <20210210173210.nnytfyrkkj6ylrtb@toshiba.co.jp>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_100431_478135_0F73C395 
X-CRM114-Status: GOOD (  11.72  )
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
Cc: bgolaszewski@baylibre.com, linus.walleij@linaro.org,
 yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210211150422.IWdKD_Y2021AJESkoS2xkfnalPySTcv0pTTbm84EeCc@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 11 Feb 2021 02:32:10 +0900, Nobuhiro Iwamatsu wrote:
> This request includes the GPIO DT patch for the Visconti SoC.
> Please pull for v5.12 kernel cycle.
> 
> The following changes since commit 4fd18fc38757217c746aa063ba9e4729814dc737:
> 
>   arm64: dts: visconti: Add watchdog support for TMPV7708 SoC (2021-01-25 09:20:47 +0900)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: a36c9ff6a2df17295e0050dc9a9d5abff4b21dd7

I see that the pull request is not a signed tag, please remember to
add a tag description and signature next time.

As the changes in here are all trivial, I pulled them anyway for
5.12.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
