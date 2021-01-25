Return-Path: <SRS0=q8Yd=G4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58EBDC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Jan 2021 19:14:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8736224DF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Jan 2021 19:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8736224DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VerQcEm40pbU+G8IHr+1s1xzQiDG1XQLAj6aZaVzKnA=; b=l06pr+OdC48gStHFKWevCzlNdc
	1zPxzyfJTJKJBL55/WCul1YLn4tTYVsJtJN43cAn2CSay4L+TssY82Cg2ri2epBwL1TAANogFzVVh
	bzXJGA8vudcNAG9V6Vtu68beHgEnY/cc9srWPoLz532fuvdVAvIFmAfHmYpsqLYW2XN24pCGS9IMH
	T00PWlYA96jTGk4OI62+PA6d6fO/e5HGBrlN1aPxrCJhoO7tGFqAecAzoGG1/Jz5jpGlz9R651eCD
	qaQPN3GqLDF3O1ZjMSwNZ8wsFEYbu35KRQ87b7XXUIfFoUu7loVz+ZZue+Eew4pdAx68kGILFqKSv
	XfvP1Oyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l47IF-00064H-Qv; Mon, 25 Jan 2021 19:12:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l47IC-00063T-Hr
 for linux-arm-kernel@lists.infradead.org; Mon, 25 Jan 2021 19:12:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E7A922067B;
 Mon, 25 Jan 2021 19:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611601970;
 bh=U1nPN11Z3rTPNxLQyWxXVsNuqtofi28hKZcIA4D922E=;
 h=From:List-Id:To:Cc:Subject:Date:From;
 b=H8A7tTnBH8OidUn0zgbpmCJbl6zqs+/iUMkoy6C4nLrSvu29C9EqxmInquJsYN2Bu
 OadmZyIHJTQPcux4/8VJ9jVnRZIEg+x3BOZoQm+pDCh4x1nlWMZDPM8+ABIQk+47pw
 eOyMpzV2KG6I6w3cjd3OJsstp+IMfwvTA9xak9PdnT7tFCbiOKw4YucLZ9mWR/D1k+
 OoUwVvUVBuoOJsAPt2cFMDAP6/tjnMHT0FaGY/etRYnPCGSyUIveLTtg72RRJ6vhjD
 /OzxayPB+sjW7EJK7tdsA2LjkMZ1SzwUTM7cRYIMvk698blBa/EVrTkRxLuPoG4OcI
 QwHdZVg6Hb33g==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Subject: [GIT PULL 0/3] Samsung for v5.12
Date: Mon, 25 Jan 2021 20:12:37 +0100
Message-ID: <20210125191240.11278-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_141252_660319_8076CF23 
X-CRM114-Status: UNSURE (   5.89  )
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
Message-ID: <20210125191237.7z-Q5LCicsPJlCZJTevBkPzwpdQ9GgxPRgRUEdKyqA4@z>

Hi,

Three tags to pull for v5.12. No dependencies, no order of pulls.

Best regards,
Krzysztof


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
