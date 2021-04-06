Return-Path: <SRS0=1rdH=JD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,SUBJ_ALL_CAPS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC8AC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Apr 2021 10:12:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A4DD613C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Apr 2021 10:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A4DD613C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8rsmI5DbGdLYUGkaPE7f7NeXVPPWt+R7on/MaEbvvD0=; b=JQnQuGht+ATmEeZVe+x727opn
	7eQYB003JaqzOQS3ZKdLUGE0B9NjWpCgp1nNrwZARFp/thyZtwr/WGUN8Vo8B5vD5MEcgetCnQtUA
	PMc/T74o25YAbRAOyPTeu9t9jjk6+mwJqbjo9lv26NkY3nmF9yDcgn6MXkTf/aNAcR9y+NF24K8Wu
	/pJQRyvA8v3DSyn6EJTToFq7BZ0BoEbVQO80o9pg9EW1BexVYmhvNHXHAS7PLYNAEKEtvNLEgqiGF
	pPl491NAZbA04xAN3rrEJAZ/P5sJWJRPTaBPBocMb/ro1ttcOo/uI5WmwoVHXnX9HJu3yhNJ/99y6
	xdfxpAMiA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTig2-0027r2-At; Tue, 06 Apr 2021 10:11:18 +0000
Received: from muru.com ([72.249.23.125])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lTifr-0027pl-Ps
 for linux-arm-kernel@lists.infradead.org; Tue, 06 Apr 2021 10:11:09 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id D503F8119;
 Tue,  6 Apr 2021 10:12:15 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/3] 
Date: Tue,  6 Apr 2021 13:10:59 +0300
Message-ID: <pull-1617703816-65652@atomide.com-2>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <pull-1617703816-65652@atomide.com>
References: <pull-1617703816-65652@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_111108_269268_B33084EB 
X-CRM114-Status: UNSURE (   8.42  )
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
Message-ID: <20210406101059.Off6cTuPf5kHXQXNb1qdbI9UyuQ5iTJU3rnVakAPQeo@z>

RnJvbTogIlRvbnkgTGluZGdyZW4iIDx0b255QGF0b21pZGUuY29tPgoKVGhlIGZvbGxvd2luZyBj
aGFuZ2VzIHNpbmNlIGNvbW1pdCBhMzhmZDg3NDg0NjQ4MzE1ODRhMTk0MzhjYmIzMDgyYjVhMmRh
YjE1OgoKICBMaW51eCA1LjEyLXJjMiAoMjAyMS0wMy0wNSAxNzozMzo0MSAtMDgwMCkKCmFyZSBh
dmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG1saW5kL2xpbnV4LW9tYXAgdGFncy9vbWFwLWZv
ci12NS4xMy9kdC12Mi1zaWduZWQKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBlZTM2
OGExMGQwZGZiMjdiYmZmMzYzNjFlYTIxNjZmODY0MDI4YThiOgoKICBBUk06IGR0czogYW0zMzV4
LWJvbmVibGFjay5kdHM6IHVuaXF1ZSBncGlvLWxpbmUtbmFtZXMgKDIwMjEtMDMtMzEgMDg6NTQ6
NDUgKzAzMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCkRldmljZXRyZWUgY2hhbmdlcyBmb3Igb21hcHMgZm9yIHY1LjEz
CgpNb3N0bHkgY29uZmlndXJlcyBhZGR0aW9uYWwgZGV2aWNlcyBmb3IgdmFyaW91cyBib2FyZHMs
IGFuZAp1cGRhdGVzIHRoZSBncGlvIGxpbmUgbmFtZXMgZm9yIGJlYWdsZSBib2FyZHMgc28gdXNl
cnNwYWNlIGNhbgpvcHRpb25hbGx5IGZpbmQgdGhlIHJpZ2h0IGxpbmVzOgoKLSBVc2UgdW5pcXVl
IGdwaW8gbGluZSBuYW1lcyBmb3IgYW0zMzV4LXBvY2tldGJlYWdsZQoKLSBVcGRhdGUgb21hcDMt
ZWNobyBsZWQgY29uZmlndXJhdGlvbiBhbmQgYWRkIGF0aDZrbCBub2RlCgotIEZpeCBpbmRlbnRh
dGlvbiBmb3IgYW0zIHRzY2FkYyBub2RlCgotIFByZXBhcmUgbW90b3JvbGEtY3BjYXAtbWFwcGhv
bmUgZm9yIHBvd2VyIHN1cHBseSBkdGJzX2NoZWNrX3BhcnNpbmcKCi0gVXNlIHVuaXF1ZSBncGlv
IGxpbmUgbmFtZXMgZm9yIGFtMzM1eC1ib25lYmxhY2suZHRzCgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkFuZHLDqSBIZW50
c2NoZWwgKDIpOgogICAgICBBUk06IGR0czogb21hcDMtZWNobzogVXBkYXRlIExFRCBjb25maWd1
cmF0aW9uCiAgICAgIEFSTTogZHRzOiBvbWFwMy1lY2hvOiBBZGQgYXRoNmtsIG5vZGUKCkRhcmlv
IEJpbmFjY2hpICgxKToKICAgICAgQVJNOiBkdHM6IGFtMzN4eC1sNDogZml4IHRzY2FkY0AwIG5v
ZGUgaW5kZW50YXRpb24KCkRyZXcgRnVzdGluaSAoMik6CiAgICAgIEFSTTogZHRzOiBhbTMzNXgt
cG9ja2V0YmVhZ2xlOiB1bmlxdWUgZ3Bpby1saW5lLW5hbWVzCiAgICAgIEFSTTogZHRzOiBhbTMz
NXgtYm9uZWJsYWNrLmR0czogdW5pcXVlIGdwaW8tbGluZS1uYW1lcwoKU2ViYXN0aWFuIFJlaWNo
ZWwgKDEpOgogICAgICBBUk06IGR0czogbW90b3JvbGEtY3BjYXAtbWFwcGhvbmU6IFByZXBhcmUg
Zm9yIGR0YnNfY2hlY2sgcGFyc2luZwoKIGFyY2gvYXJtL2Jvb3QvZHRzL2FtMzM1eC1ib25lYmxh
Y2suZHRzICAgICAgICAgfCAxMzIgKysrLS0tLQogYXJjaC9hcm0vYm9vdC9kdHMvYW0zMzV4LXBv
Y2tldGJlYWdsZS5kdHMgICAgICB8IDE0MCArKysrLS0tLQogYXJjaC9hcm0vYm9vdC9kdHMvYW0z
M3h4LWw0LmR0c2kgICAgICAgICAgICAgICB8ICAyOCArLQogYXJjaC9hcm0vYm9vdC9kdHMvbW90
b3JvbGEtY3BjYXAtbWFwcGhvbmUuZHRzaSB8ICA1OSArKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL29t
YXAzLWVjaG8uZHRzICAgICAgICAgICAgICAgfCA0NzYgKysrKysrKysrKysrKysrKystLS0tLS0t
LQogNSBmaWxlcyBjaGFuZ2VkLCA1MTQgaW5zZXJ0aW9ucygrKSwgMzIxIGRlbGV0aW9ucygtKQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJt
LWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtl
cm5lbAo=
