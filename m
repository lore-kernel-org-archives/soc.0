Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD9DC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:52:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C02CF61139
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C02CF61139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kH8kfI+vZg26VPfWUyENTE/sCjSWE9D7Gk2qQetvNgs=; b=ezHPORHIntsMGMPXuAcO8wnqp
	4OxEWAMF72yi9CAmbJl3ootzL4tC/m+3bqs8+6tdrWJAE611Uc2SDbR/xncZLEfPTLdSNNN5b3MG1
	mkaxSPpGQuQ1Y9A03zLAeiYE4wCUZ6KC5izEdvMcS+NmMvEnEGt0qJ3W/C7nvxK8mJh352tug39ad
	IooJa2FI1GMuNxMdfPx7CVB6eL1K1a3cHbJjj6CkRuGOFsPbYfkeqGnZa82mgnzDV6Gdh1pVUP5/0
	i1HQowXxkT1ksVBDic/KYoANsTPWyaF/j46rWRAc9n+DDYe7GZnW/63EMas2E4QHIX7g9PId/htjf
	gexNy1nmQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUWvZ-008VQQ-Hr; Thu, 08 Apr 2021 15:50:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUWvP-008VMG-L2
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 15:50:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A91BC61132;
 Thu,  8 Apr 2021 15:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617897030;
 bh=xeNSzYM/Ta9cIglDv1HNHX8o3BK030gkoZ/JrlML3XM=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SNDo+fh9LOkioIFghwtUH026j3WGjodgHZmY/pxrycvoyPbH5hMLY2TU8jQxTV0QM
 A/CsXt4VchWV7iP5boxCuDj1mfAElc6J0JflyAyzxmy/dZGiRFV2l4f8xtGJcxS4BK
 zgKsqFxX201evs12hVij9odjR8rZQX5UEBk8k5LlEzpjDCddZzqvt6rlRdO6u1ZVdI
 ZxJq38Vcqtz7UCZXiGbLvN4irbVK/D/LkQlwnVpUZ6/Aj6mH3/KacwzyGfJtATD6GJ
 7wk1pCNm5tMfMQGoJDXKI60G47VB0F9N22fJJEplkNXM/sXHtKaIq4AezLbPjj6bgK
 N+LskFGVENPpg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Gross <agross@kernel.org>,
 Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Olof Johansson <olof@lixom.net>,
 Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] Qualcomm fix for 5.12
Date: Thu,  8 Apr 2021 17:50:23 +0200
Message-ID: <161789701046.1636297.9206583528663846986.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210404155604.712236-1-bjorn.andersson@linaro.org>
References: <20210404155604.712236-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_165033_212776_5F80F676 
X-CRM114-Status: UNSURE (   6.19  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210408155023.KDlLwPq4WWB6QT35LNolyF38qQnAcWb8bbqlUzHig8Q@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 4 Apr 2021 10:56:04 -0500, Bjorn Andersson wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-5.12
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: aa68a77863b3fa74aa6659c7cb46ce708a09429f

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
