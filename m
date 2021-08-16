Return-Path: <SRS0=o35/=NH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C24C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:26:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDB1360F11
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDB1360F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WwtpQV8ukWGrgl6iCIvSTxtF3DBVIayp0ZuMVMhwCV4=; b=BGECVeBg/bxbo9
	06KPgLWGfk+kYrebLYyjjy1tAg3fwzOjWXsvotpuFXMVU4EBnqaKcOUl8dzdjryPmA9ZDykAZrKZ5
	Uw3GK742nj7toe8BeKJGtpC5AZZ6gkA2+PPu6lc7hSb9e7z3YpGJCSAhBruAfvyA655kURftkviWz
	R+CgnbbOEQTpD3FWcf+r9WrbDU6HALB98qsimkqJgCnU6mo9G3IKcQkuHPyl3hsecjt3oz4PyvY3h
	DKR+GSIKdYbCS6AN/IrAFXlPwXdfjOSdSSVMM9kjD5JXmv26J7tdPMs65foFTVd2omhW/iIal5A1u
	cbhMFiEajlamV1xMNTcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFk5m-000Llm-Dt; Mon, 16 Aug 2021 21:24:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFk4K-000L6C-4X
 for linux-arm-kernel@lists.infradead.org; Mon, 16 Aug 2021 21:22:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F3CC60E97;
 Mon, 16 Aug 2021 21:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629148971;
 bh=ZFj4YWcgbOOSBRfEM+e7EdPIzRqLNfUQDTZRDYpIV2M=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BZrGIbf3Ta28wwjfXY0M9WJuoKpCT4spGl3m05C8xwZVrRgR7E3HenOra0TcO10Vx
 iFGwShh1SzF9ZW6AjkeiAYvMa61YiC41PDupP+uNO5k+ngVCdIQF5J+QqWVaGTQ5Sp
 DtzK5GKOl2ZMMVmf7X9imohWLb5T7/HerVaelx6Vvc0oWTCB3ZsJjXaDudpfWgpT9d
 L/w6s7T4qh437eR0a2s7mBaBS6pof0Ij/TGmeMNEPnLTJl2qPRcE+xlxqEZUvsIDjq
 yRZ5hIJ8V7zUqkwWD65o3U3Lqx+Yp1WtLd4CPO4EtINouaouOU5XQp8zWVb5QHQotG
 o/J6q5CgoDjCA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, soc@kernel.org,
 arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Olof Johansson <olof@lixom.net>,
 Petr Vorel <petr.vorel@gmail.com>, Sibi Sankar <sibis@codeaurora.org>,
 Caleb Connolly <caleb@connolly.tech>
Subject: Re: [GIT PULL] Qualcomm ARM64 fixes for v5.14
Date: Mon, 16 Aug 2021 23:22:47 +0200
Message-ID: <162914895749.238791.1673033166208068515.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210816205030.576348-1-bjorn.andersson@linaro.org>
References: <20210816205030.576348-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_142252_266556_257F5C72 
X-CRM114-Status: UNSURE (   6.43  )
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
Message-ID: <20210816212247.EG-WPok4YyUwOH8-1kpQI18IQk01NqYLvrf1WLNozGc@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 16 Aug 2021 15:50:30 -0500, Bjorn Andersson wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.14
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: d0dc706ab1924e2f41677741cfa26f1c9ed6ce93

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
