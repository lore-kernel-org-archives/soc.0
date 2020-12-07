Return-Path: <SRS0=s/rV=FL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 773ACC433FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Dec 2020 07:46:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EF892220B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Dec 2020 07:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EF892220B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mGGRIbuTzJFqwb4LkfXHXXUI5tARad/d5Jud2SQyWoo=; b=zFgDjnBql1dotiOG1H4+ctoRQb
	992FZ2BRcrRydzwNFrkGry4lmkFiYF+9smm0J7OAM9Gyc1hvvp5exp6GnE1kmpXLTUs6NxUVaRE9l
	ZyFmRfW5zWUh/YmgWjodYDzsYXulmmqPoYx62KtgyUOOChLyW5hzdojCrytwGjGSU/I93Fsly+p4J
	YD6UXjaxqlCFH6/fSZweIhGvaauATCXrUYpMRMm+RRLR9GW5HxyWPnQ071kwtWRC469stmRJ38rUe
	gvG4co4w+GadpUu0dCft5ohlSspQX19W3xlhCJ3n6ZYwxChLAnQKC++et3fPiE3eUJGAv0RSXslen
	gdFK0pHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmBDS-00060w-QD; Mon, 07 Dec 2020 07:45:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmBDP-0005zi-Rk
 for linux-arm-kernel@lists.infradead.org; Mon, 07 Dec 2020 07:45:48 +0000
From: Krzysztof Kozlowski <krzk@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Subject: [GIT PULL 1/2] soc: samsung: Second pull for v5.11
Date: Mon,  7 Dec 2020 08:45:27 +0100
Message-ID: <20201207074528.4475-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_024547_984673_8FF0ABD4 
X-CRM114-Status: UNSURE (   8.41  )
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201207074527.vdr5rZwZeWjg1znlqZDZ8wg50r4OryyQQBLg_Zjgtdc@z>

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit 124f035310adc781d91cdf0b7c6e4fb3c7e43e23:

  clk: samsung: allow building the clkout driver as module (2020-11-12 17:18:40 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-5.11-2

for you to fetch changes up to 4c44274ee457e3f7012dc532c8c9cc8964a82612:

  clk: samsung: mark PM functions as __maybe_unused (2020-12-05 15:13:17 +0100)

----------------------------------------------------------------
Samsung SoC drivers changes for v5.11, part two

1. Mark PM functions of newly added clkout module as unused to silence
   !CONFIG_PM warnings.
2. Initialize ChipID driver later - in arch initcall.

----------------------------------------------------------------
Arnd Bergmann (1):
      clk: samsung: mark PM functions as __maybe_unused

Krzysztof Kozlowski (2):
      soc: samsung: exynos-chipid: order list of SoCs by name
      soc: samsung: exynos-chipid: initialize later - with arch_initcall

 drivers/clk/samsung/clk-exynos-clkout.c |  4 ++--
 drivers/soc/samsung/exynos-chipid.c     | 11 ++++++-----
 2 files changed, 8 insertions(+), 7 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
