Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4112C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 22:48:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAC2964DE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 22:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAC2964DE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sifMZLAwpt3INIuSfI1yuN2wpJstkEaUETGioVBryVU=; b=IXgj1/YjXOPoFsMFNuMse/qM0
	lkgsvsFtkyYA4Fx1AxuRyXaVksid6UZJBCCXq2c0poSymWcuvnneIgiDGLhhct3SBswbHFr2CvNg4
	ljBUgGuGxk2EemY6BX7cI72TBx46+lucqT9hhZH6G0EBME16QBfaP/BoCKYZs9f5g+dBPDI9nx/E+
	cbmZ7UMHG5Ptni5yWqwIFwMEHe7Y9m1NJDFPf7Ypw/38GU/UL5UC3WJxNM1oYofX8OnukvqBpLwUc
	Jge7r2XTNSuK5zF350KveyR1Xkr3iYCp3qmnCAXnTnWFctfEDVkbsH+Owa5mOa4sl9xLc5qvvZ/ni
	VhiZnKk7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9bnI-000338-AY; Tue, 09 Feb 2021 22:47:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9bnF-00032K-E1
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 22:47:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5417364DE7;
 Tue,  9 Feb 2021 22:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612910856;
 bh=GxyReVb6FlPGpkfTjkb2isnODz14oYAH5DEalWelaEM=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z+Iu/5u0+Ersgt/GwpbO4mg5aUr5N91xBWIJ9Xs1evMppRfwx9xZy3kPjmQ0daC87
 XDKj69QBvWu0LBNbvk2aso4TuDJjXhecofntmmgXEMXcGIqL10R8eKpzSqws5k7Agy
 SRdU7lBJY35T+QraQXKugQ1AEgH8m0IEGPY6+OfcyjolQzanQknPIdsxrePy1InpMA
 VxyKqRUTYonIHt5RgjG2qavRmQ/yEu0PDUU1xnWSgy2yWDfVJmmmTqRcKJknRaj+QH
 M3R1bW7hipD/BraAvWe78S6wuUFD4YbBRFVob3ej+KWx+u658MjCJWXL8n3vLkSJAO
 z4C601cDACaVw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>,
	soc@kernel.org
Subject: Re: [GIT PULL] SoCFPGA DTS fix for v5.12
Date: Tue,  9 Feb 2021 23:47:33 +0100
Message-ID: <161291001530.971667.9855298480195690176.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208203703.36109-1-dinguyen@kernel.org>
References: <20210208203703.36109-1-dinguyen@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_174737_562934_5C507FB1 
X-CRM114-Status: UNSURE (   8.56  )
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
Message-ID: <20210209224733.VkxB-lEZ6k-HggLCBhrIIS8C-5p8o7sbF58Lwp8-7_E@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 8 Feb 2021 14:37:03 -0600, Dinh Nguyen wrote:
> Please pull in this SoCFPGA DTS fix for v5.12.
> 

The commit has a fixes tag, so I think you mean 5.11 instead of 5.12.
There is no need to delay bugfixes.

> The following changes since commit 1048ba83fb1c00cd24172e23e8263972f6b5d9ac:
> 

Note that this is based on v5.11-rc6, while my arm/dt branch is currently
based on v5.11-rc2, and I prefer not to have any backmerges. The arm/fixes
branch however is based on -rc6 already, and it's a trivial change, so
merging it in there, I can avoid making you go through a resend.

Merged into arm/fixes.


merge commit: 090e502e4e63c608ef8497d295feeb9743ef67b7

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
