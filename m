Return-Path: <SRS0=ZYY7=ND=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9DD6C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 21:08:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A28360ED5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 21:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A28360ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yoySeLQ5TcZcPwZGxVsgCVeSu3UsO2r+M/YhxqwWbWE=; b=Dg+c74P+7hyMLx
	tqSVghvxFIQDfTX81mX9+jnEzPX44sLiWRXFJBg7DeTjwpQC+nDxyOqMmM1oua/Z5ynrrAaqe6ALv
	VCb2asbg39MXDZ8SD+2QaakI6UGj9DLxP/w/NvTCLE+VQ0xyO48UK3LNBY5IiyiBRXcYRiBgw8uAH
	i9pV3024Fk0Y+/0ElFNm1/p5/BiXJ+usjET62bccSEJ5m9J/tv474LkvlLjACDCt86mZ2BdFKXZF3
	QwLDkDexMNMTgclSYDXcU+r5VOyXzrI7LJG+Ch6UvvjfM2nZsAC2jlPZZ0LHn/bTXL55dgkvXWF+i
	lw70mIjrnFfSdp9ehAQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEHtv-00BJWk-MO; Thu, 12 Aug 2021 21:06:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEHti-00BJTH-15
 for linux-arm-kernel@lists.infradead.org; Thu, 12 Aug 2021 21:05:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0D8D61038;
 Thu, 12 Aug 2021 21:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628802353;
 bh=ppLfQb+71afaFf0JyXs9NNbvHqbMz0mmZJUsHCLkW0w=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I/l71ytJh318Lpa1fcg2/7kZKugX26pQ6WhGARJVbTExAoDjT4k8us7xKf5456u0e
 hCFqIqtJqRYfcAGcGt2/fXn72BsNI+G2mTyr/pX8mPHx0jMShRbc04Kr72SQ6tq68/
 FnAX4qzOIxWphN0BH3IMr5B3pSgbojNWSirsiFp3FeHn/pzztHKoyTgA637JhF3Ll0
 vFKEJQQFfODS8JB9aaMcFjpWsojC1lJNT7UCAq59TnGm4RZPI+nySsXNNb3K2HXX68
 Xls7P16yFvGcfAf+9v8NtZnOagyaFTd6kPCLKwVzTh1g27cYekd0BmCFFV5GhzCtN/
 d2uN55xzEK+bA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 1/2] ARM: dts: samsung: DT for v5.15
Date: Thu, 12 Aug 2021 23:05:36 +0200
Message-ID: <162880206174.1376011.6163720025669210158.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210811085128.30103-1-krzysztof.kozlowski@canonical.com>
References: <20210811085128.30103-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_140554_137163_52627EE4 
X-CRM114-Status: UNSURE (   7.28  )
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
Message-ID: <20210812210536.7b90iUXbrvO7Ptzix8HgYXj1J1UQRh57VdWW4eoJDuM@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 11 Aug 2021 10:51:27 +0200, Krzysztof Kozlowski wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.15
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 0b72a27e1d5d2dc54d289a147411229fa0ed2084

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
