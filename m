Return-Path: <SRS0=+Itf=JG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18BF6C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 20:02:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92CD8610FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 20:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92CD8610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dO9vnHsYmLqotycEIlpIIDmCYICV2h7c6NznncuJW4M=; b=l5u5qF9DdSZzSUm8Z4MpBOhoe
	v6W6j79QkfMZMY0qD140NQ1WuIwLno7HbwAWGT4QTFd/C9DclhIjlOCZQZZFqkDbl3MoefC/lqcRV
	r+PoSoF0q+7WRi32ruz4uoksM1WRqwEuxbHdmRCNoTHRiwygVgyIMMP9Zcn7uA2KwMnKn/v8eCNyn
	Nk/yGwrMziJSDJCm902zYWYLPRZfSG2Cx0Kk4TbWawLXudayLcAq47Hdyu48J9EZlwZDMsKUo09Lf
	sEHpbXQHDJvOKDFid2gj9cFQWuX0ewwVe3EdoN3nKHi38+Phf1zGaZyZS1dIGOkxOk5PGqmoaAyVj
	wPAtHjPjg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUxDp-001Rwo-JF; Fri, 09 Apr 2021 19:55:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUxCq-001RvY-Ec
 for linux-arm-kernel@desiato.infradead.org; Fri, 09 Apr 2021 19:54:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:List-Id:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=y1g+UuBdgr7YWcTlrxAyoUPW4U1qHBTBGjvv1QrK5nU=; b=w8fRUE//4Ua5WJzAxfK1dFtJdc
 3NHiT9KB81tuLQAJG0DousBdd33rSaWbgEdq8WSq8OgU5gn3VABngVvDfLF5qTbWadoMQSUf37D1i
 +A9CALcmBpv2swMJx0SV2qFnmW324Kw/FtPArhzg0isRurYEWUPVvwFqseOrjXAnlhanKaE7FSYnA
 wn83B0UoV6vvTcJPYy8MWqXMPegYAf58g5Nj1DCow16+44g7Z182dgeTlPDtty3ujD85hyEACN5xL
 I5J+wjNwNyI9xpBdT5pLt4jp8vnShCPtA9Rnl9zDm55P4ekVycyALTkZb5aFu2ghBwrpKCHu+lkt9
 NPLhIiOg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUxCn-004lyf-NN
 for linux-arm-kernel@lists.infradead.org; Fri, 09 Apr 2021 19:54:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 15FB1610CA;
 Fri,  9 Apr 2021 19:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617998053;
 bh=cOzyZqca5gwW2gABD9EnRTP6HqnEfJigmShKZpH8ayo=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g8/9j7hCL0IuLIZ9M6dn2nlwTIszeftBcLdd7o7os7uUI8JXwldEKZrd+7nOh5TiK
 9K/lzrnw3nnsZIN4hDh1jm7gYmgkabMWPmLsrGQkrONyf7zwaO7u3d8mUFZJNbOz3z
 HMs5/VUmRz8xWx/GxWDZfXRMZgSMWpUuhRxPBWyrFhGbl8PfOOPmzLpZxD24GrRLSA
 k1rRD2GYZQH5ChFv1ehy63+3K/Fgg3ZKprFp1B9DvW2HRWtyukndbwVm7BXTr7Q9/h
 KDm7+epwEs94Op/dt1KCfLFGcqWAJ0LguDunAIP9mxhhvhj4ksbfaV6eAFzRCIItmf
 V+ARDfRfHk/Fw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Gross <agross@kernel.org>,
 Olof Johansson <olof@lixom.net>, Qinglang Miao <miaoqinglang@huawei.com>,
 linux-arm-kernel@lists.infradead.org,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-arm-msm@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [GIT PULL] More Qualcomm driver updates for 5.13
Date: Fri,  9 Apr 2021 21:54:08 +0200
Message-ID: <161799803678.1862045.4284365394007319918.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210409162001.775851-1-bjorn.andersson@linaro.org>
References: <20210409162001.775851-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_125413_804027_7B3B7AEA 
X-CRM114-Status: UNSURE (   6.64  )
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
Message-ID: <20210409195408.lLrr8UYLBWJFowej42FjdG46AT5bzl4FnaDvtBDWRlo@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 9 Apr 2021 11:20:01 -0500, Bjorn Andersson wrote:
> The following changes since commit ac6ad7c2a862d682bb584a4bc904d89fa7721af8:
> 
>   bus: qcom: Put child node before return (2021-03-29 22:01:27 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.13-2
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 30be8446db39be8dc52fc8cd2cb601d3d6319e9d

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
