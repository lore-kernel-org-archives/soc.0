Return-Path: <SRS0=N7fp=HB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8192C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:38:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F01564DDF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F01564DDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uPaMnOWDpj4L9jnYwSoC4MWBsh2DuPo1I0bq4S//EVM=; b=SuvLhRncYMo0SBa8o90dW26e8
	P4NNrSCxT0bkLte3W/GQw0jg4nhK33l5LYlFZW4IE+s+g1bd2az3FJauuGmEgIXjCjjCwd6r+YwyL
	r6Dqu9eyrVznZNbXQqKNEqyxJhzRiyJqP8weMjtmI0qYnhM5Pg/NJhDgWCwbb7hjawqg5noTpC1WP
	It3a8WAhCIQjMfioAh0l6uAfjnpX7WBRFBemHSq09J3sfgbCAfhrMScVJiU6mWL/6WoT+JUCTVuvt
	Sb/8boe/ieo/57pUXlK9ZepWJkiO6Bu5qo3iPg+Cw6x4jND+iEvF/jZ8X5VBd+JzW0VfoatR3ee9x
	6LxYngp+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5oYj-0002PE-5N; Sat, 30 Jan 2021 11:36:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5oYe-0002NX-W1
 for linux-arm-kernel@lists.infradead.org; Sat, 30 Jan 2021 11:36:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EFEAA64DE7;
 Sat, 30 Jan 2021 11:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612006612;
 bh=0BmqgNkFIayug654qP6zSh3IMYPIZwHpy2DU2XcmwmM=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pNiWSlR20+bCSNZa8PcaZjNSZw8e/GL59crl5H2InHgwcGi/ZrsRVBIz9H2LHwym5
 4hcGuN2HdSqb2MQjcOgcUo1SYBr/KseIa8syfK0m+Pfo3DRP5/UgDds+h8mLsBhcH+
 P4Qszegsou0FJrmNDhoEqrSQbXu24DCdKGVwr1uXPd/eMfRWPSVBklANdfaf2MVmHK
 7ZC5ir7xSVWym1lGP1Is+x03tntzK9sU9JjfsjD10ctkN4m5YdNm2lnoPIfakgiYfJ
 RVF6WtaB540bvuj4h8C32mCZX8Yv7rFSiuuWrzie910AddQTzV9PKsRqFE15XaPn6f
 mGrmZIxiLyuvQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Subject: Re: [GIT PULL] Fixes for omaps for v5.11-rc cycle
Date: Sat, 30 Jan 2021 12:36:48 +0100
Message-ID: <161200659667.2416228.1843955519499955570.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1611818709-243493@atomide.com>
References: <pull-1611818709-243493@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_063653_105466_2572CCEB 
X-CRM114-Status: UNSURE (   8.72  )
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
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210130113648.wCSpFme6DGmrywoZptYHUqrnOLApCMYYqFuV-PHwR00@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 28 Jan 2021 09:43:50 +0200, Tony Lindgren wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/fixes-rc5
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 2a3e487a3e538b3a87d0a4ea71f185437c38e55e

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
