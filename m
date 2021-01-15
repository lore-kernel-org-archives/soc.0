Return-Path: <SRS0=ftTf=GS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBC5C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 17:27:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 359E423382
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 17:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 359E423382
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tsDZVm/cxPyRFJIB+pBYOAkJBQrSY6vRls3zR4Wc+lE=; b=MrOGSY/knf/MNU9E5uXIv/wkc
	gpPKoywQqZJ3tvhmxOwKrBiuQnAD0lRxizMbsc+1cWeT4+JvrJdJ37gd2MZr0LMK2kTE3E/cg81P+
	cPxrmIvXlXR5ECvC/UIfeLJHyOlQIoAu+9om2qA45xS52jnCoBTk54ew2PMQy9/m1Kxi3ndZgxya+
	/SYpyYu/HtNshixtAUOXP53kiFCPUPoj/6DFzJtwosZhWNx1yYFe54TYG0O8GUPSIm+qWk80wzK9+
	zlSNptNu40DhvXeVh5vq/b0cpUZyR7LAs4D/ccCaz3koZSbm0uFg5l3FVZcG8x0QedfUtnqKmQ3os
	+j44jgkYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Sqc-0005ZI-CY; Fri, 15 Jan 2021 17:25:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Sq6-0005Pn-2q
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Jan 2021 17:24:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCA3D23382;
 Fri, 15 Jan 2021 17:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610731485;
 bh=n2hBOFeDu37LHCmefgAJ85SO0w5t39jbH+HguNvqYYw=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JRIPnRBMOqJKCTQRhCz1KFVq5M0AIRVT12v2LHuUuV2pTkm49nHvwzRqrsVSdu1KH
 bLJgSRtJa5SOPW3y2IOnpodJMl0o2qilZFKRtr1XPPKystbhqlE/oLwDn/tBvv+LgY
 u6wXrCikv+USHWr2w2SE89zZsmwCSO6MlQo18N+p61dLY/E4anUkoc/ahGLURFvUIb
 2ahnudtJ0cp9fUE88rDo+r/FNGsqbLtJYlXb4HmXuL4jnvPtalROPlHjT2IC0YuLch
 VTz93M9Jzi6Rpq4HU8G7gPVRt6aLRWaZjj2ZT8j0kmLPdHOHWxObNFgt1XelhIneMa
 2/vBTGaiN0YMA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Daniel Palmer <daniel@0x0f.com>,
	soc@kernel.org
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: Fix misordering introduced
 by honestar prefix
Date: Fri, 15 Jan 2021 18:24:36 +0100
Message-ID: <161073140457.707311.6221640071925135025.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201212012253.373074-1-daniel@0x0f.com>
References: <20201212012253.373074-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_122446_240377_CA140FF5 
X-CRM114-Status: UNSURE (   6.85  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210115172436.4DPrdOZpzbPkxgRxd32N2YTWJKNwGojGSbilVFqNXaI@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 12 Dec 2020 10:22:53 +0900, Daniel Palmer wrote:
> The prefix for honestar should come before honeywell.

Applied to arm/dt, thanks!

[1/1] dt-bindings: vendor-prefixes: Fix misordering introduced by honestar prefix
      commit: f791f1a498fbef783e7711db9f597de7d85b661a

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
