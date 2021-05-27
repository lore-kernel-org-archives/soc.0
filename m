Return-Path: <SRS0=UvO8=KW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A2FC47089
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 May 2021 01:19:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C285F613C5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 May 2021 01:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C285F613C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aefE+4Os4uObdPvlHGULVfAFeQ82KgfShfeg/8ReOxQ=; b=y6Uh2/8RprEKNL
	H1Wk6adb7jkQQvD7M3XaH2cA+xHf1JP4Np5sataQEojFLjeOQZNbEFs6x5UOGlHIoWjuTkmuiaNtC
	AM5XqAF/gNMxOqmAEV1g4LMcAILDDfCicKbfZLLzvw1Qdo3xE/wlp8zKm7WEGOnNSyiuaOwxmWUaE
	eXp9fWLwJzfs6q8sjcrlbM6ePyLGGVWSxVjHQpmY2VlyCFcRx89KyNqEhhqQ5WxIenRS9rxhz3G1V
	NgLS9rCiA1GKkvhKTczNTOxTcztsDhu8x0rQruxfDw99jqnEzesH/Q8clCAs+K5nFO8Rn6696k1fl
	IigL2dhlsQBc4vTKlFCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lm4f2-001Q1q-NA; Thu, 27 May 2021 01:18:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lm4ez-001Q0e-JW
 for linux-arm-kernel@lists.infradead.org; Thu, 27 May 2021 01:18:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E4C961059;
 Thu, 27 May 2021 01:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622078284;
 bh=mrU0f/4PzECYrgli7WZl27Qts9aZpcs3dMPNJ7AnXHA=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=Ez25bpDkQsBn694hIm9x4bj/1ZgDGxHacQjxslECtVOfwjS2XxnU3htOP1RO+6S/W
 oblrjzrJDq8pFrEbqfYdbFetfKjWwZl0U9buGJ16ToOdlRNvJKqwPAg9Qi24CmrUYk
 6WaNH0ZqZlBAZkH8BJBdavLI9Xl1YSMCfoBeB7YtvUZ52BUuvrwbiQPWW5ZByuJom5
 mJ50G32MnSe9mlkzRB4hVXsUsv90L3kD7qe+qYfJm9IsHqcPE/9mLcEe85YUbm916+
 1eow0VIUmerzAW0UhwobZY5hzPgDZLvK604kO2l30In1MfaxjnH7Ma/ALFSP9RuDj9
 ybQJOUrgpaZ1Q==
Date: Thu, 27 May 2021 09:17:59 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
 Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
 linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.13
Message-ID: <20210527011758.GD8194@dragon>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_181805_732368_50CB164F 
X-CRM114-Status: UNSURE (   9.58  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210527011759.UwLcUZgRJecm2HdWDyvSWePT-Wc8hRnJ7Q9EC4yLXnY@z>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA2ZWZiOTQzYjg2MTZlYzUzYTVlNDQ0
MTkzZGNjZjFhZjlhZDYyN2I1OgoKICBMaW51eCA1LjEzLXJjMSAoMjAyMS0wNS0wOSAxNDoxNzo0
NCAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc2hhd25ndW8vbGludXgu
Z2l0IHRhZ3MvaW14LWZpeGVzLTUuMTMKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBi
NzNlYjZiM2I5MWZmN2Q3NmNmZjVmOGM3YWI5MmZlMGM1MWUzODI5OgoKICBBUk06IGR0czogaW14
OiBlbWNvbi1hdmFyaTogRml4IG54cCxwY2E4NTc0ICNncGlvLWNlbGxzICgyMDIxLTA1LTIzIDEz
OjM2OjU5ICswODAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQppLk1YIGZpeGVzIGZvciA1LjEzOgoKLSBGaXggbWlzc2lu
Zy1wcm90b3R5cGVzIHdhcm5pbmcgb2YgJ2lteDI3X3BtX2luaXQnIGluIGkuTVgyNyBwbGF0Zm9y
bQogIHBtIGNvZGUuCi0gQSBjb3VwbGUgb2YgcGF0Y2hlcyBmcm9tIEZhYmlvIEVzdGV2YW0gdG8g
Zml4ICd0dW5pbmctc3RlcCcgcHJvcGVydHkKICBpbiBpbXg3ZC1tZWVya2F0OTYgYW5kIGlteDdk
LXBpY28gRFQuCi0gRml4ICcjZ3Bpby1jZWxscycgb2YgbnhwLHBjYTg1NzQgZGV2aWNlIGluIGlt
eDZxZGwtZW1jb24tYXZhcmkgRFQuCi0gQSBjb3VwbGUgb2YgcGF0Y2hlcyBmcm9tIEx1Y2FzIFN0
YWNoIHRvIGZpeCByZWd1bGF0b3IgYW5kIHZvbHRhZ2UgZm9yCiAgaW14OG1xLXppaS11bHRyYSBi
b2FyZC4KLSBBZGQgbWlzc2luZyByZWd1bGF0b3JzIGZvciBpbXg2cS1kaGNvbSB0byBhdm9pZCBw
b3NzaWJsZSBpbnN0YWJpbGl0eQogIGlzc3Vlcy4KLSBGaXggbWVtb3J5LWNvbnRyb2xsZXIgc2V0
dGluZ3MgZm9yIGZzbC1sczEwMjhhIERULgotIEZpeCBSR01JSSBjbG9jayBhbmQgdm9sdGFnZSBm
b3IgYSBjb3VwbGUgb2YgZnNsLWxzMTAyOGEta29udHJvbi1zbDI4CiAgYm9hcmRzLgotIEZpeCBS
R01JSSBjb25uZWN0aW9uIHRvIFFDQTgzMzQgc3dpdGNoIGZvciBpbXg2ZGwteWFwcDQgYm9hcmQu
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCkZhYmlvIEVzdGV2YW0gKDMpOgogICAgICBBUk06IGlteDogcG0taW14Mjc6IElu
Y2x1ZGUgImNvbW1vbi5oIgogICAgICBBUk06IGR0czogaW14N2QtbWVlcmthdDk2OiBGaXggdGhl
ICd0dW5pbmctc3RlcCcgcHJvcGVydHkKICAgICAgQVJNOiBkdHM6IGlteDdkLXBpY286IEZpeCB0
aGUgJ3R1bmluZy1zdGVwJyBwcm9wZXJ0eQoKR2VlcnQgVXl0dGVyaG9ldmVuICgxKToKICAgICAg
QVJNOiBkdHM6IGlteDogZW1jb24tYXZhcmk6IEZpeCBueHAscGNhODU3NCAjZ3Bpby1jZWxscwoK
THVjYXMgU3RhY2ggKDIpOgogICAgICBhcm02NDogZHRzOiB6aWktdWx0cmE6IHJlbW92ZSBzZWNv
bmQgR0VOXzNWMyByZWd1bGF0b3IgaW5zdGFuY2UKICAgICAgYXJtNjQ6IGR0czogemlpLXVsdHJh
OiBmaXggMTJWX01BSU4gdm9sdGFnZQoKTWFyZWsgVmFzdXQgKDEpOgogICAgICBBUk06IGR0czog
aW14NnEtZGhjb206IEFkZCBQVSxWREQxUDEsVkREMlA1IHJlZ3VsYXRvcnMKCk1pY2hhZWwgV2Fs
bGUgKDMpOgogICAgICBhcm02NDogZHRzOiBsczEwMjhhOiBmaXggbWVtb3J5IG5vZGUKICAgICAg
YXJtNjQ6IGR0czogZnJlZXNjYWxlOiBzbDI4OiB2YXI0OiBmaXggUkdNSUkgY2xvY2sgYW5kIHZv
bHRhZ2UKICAgICAgYXJtNjQ6IGR0czogZnJlZXNjYWxlOiBzbDI4OiB2YXIxOiBmaXggUkdNSUkg
Y2xvY2sgYW5kIHZvbHRhZ2UKCk1pY2hhbCBWb2vDocSNICgxKToKICAgICAgQVJNOiBkdHM6IGlt
eDZkbC15YXBwNDogRml4IFJHTUlJIGNvbm5lY3Rpb24gdG8gUUNBODMzNCBzd2l0Y2gKCiBhcmNo
L2FybS9ib290L2R0cy9pbXg2ZGwteWFwcDQtY29tbW9uLmR0c2kgICAgICAgICB8ICA2ICsrKysr
LQogYXJjaC9hcm0vYm9vdC9kdHMvaW14NnEtZGhjb20tc29tLmR0c2kgICAgICAgICAgICAgfCAx
MiArKysrKysrKysrKwogYXJjaC9hcm0vYm9vdC9kdHMvaW14NnFkbC1lbWNvbi1hdmFyaS5kdHNp
ICAgICAgICAgfCAgMiArLQogYXJjaC9hcm0vYm9vdC9kdHMvaW14N2QtbWVlcmthdDk2LmR0cyAg
ICAgICAgICAgICAgfCAgMiArLQogYXJjaC9hcm0vYm9vdC9kdHMvaW14N2QtcGljby5kdHNpICAg
ICAgICAgICAgICAgICAgfCAgMiArLQogYXJjaC9hcm0vbWFjaC1pbXgvcG0taW14MjcuYyAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMSArCiAuLi4vZnJlZXNjYWxlL2ZzbC1sczEwMjhhLWtvbnRy
b24tc2wyOC12YXIxLmR0cyAgICB8ICAzICsrLQogLi4uL2ZyZWVzY2FsZS9mc2wtbHMxMDI4YS1r
b250cm9uLXNsMjgtdmFyNC5kdHMgICAgfCAgNSArKy0tLQogYXJjaC9hcm02NC9ib290L2R0cy9m
cmVlc2NhbGUvZnNsLWxzMTAyOGEuZHRzaSAgICAgfCAgNCArKy0tCiAuLi4vYm9vdC9kdHMvZnJl
ZXNjYWxlL2lteDhtcS16aWktdWx0cmEtcm1iMy5kdHMgICB8IDEwICsrKysrLS0tLS0KIC4uLi9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1xLXppaS11bHRyYS5kdHNpIHwgMjMgKysrKysr
Ky0tLS0tLS0tLS0tLS0tLQogMTEgZmlsZXMgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgMzEg
ZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hcm0ta2VybmVsCg==
