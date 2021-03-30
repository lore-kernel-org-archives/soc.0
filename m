Return-Path: <SRS0=+/G9=I4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C378EC433C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Mar 2021 18:42:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D74F61968
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Mar 2021 18:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D74F61968
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xudkx4WQPQrgofumuYxvOFn5v3hr4jLXGT0oNMqJXyo=; b=ItThW8Edhyh9//nFJJaGOqwElr
	kh4e/RtUDlLukMwYGoQN8BAHSWlfhMJ5Kh38LXukM9zqAFVN4dXbqiDAs9HXTYNuczQYZMiwwNoBF
	epZuyqz9xqSVY0gC8lc8IoPI9QBTWAxdiqvMqvr7Wcn5A0ZorIVjIxbpA0eIWBzPZKi34U7ZVJyjc
	yWs1YicVY9tWm/plOXdXidNhPRm3RheY/sgL8vpL9CLYixbO8wbTpUc320hXTbsu0DnucwYkY7iNp
	TEfJjcwEqD1NQTnasvYd+olJJo4PxkZFTNvBz8fBVlBtDDAQEgoRuwooSQ6gZN4nkIdkbNEsPMyKj
	BCtZm7dg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRJHn-004eAO-C2; Tue, 30 Mar 2021 18:40:19 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRJHi-004e93-Sg
 for linux-arm-kernel@lists.infradead.org; Tue, 30 Mar 2021 18:40:17 +0000
Received: by mail-pl1-x634.google.com with SMTP id o2so6617244plg.1
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 30 Mar 2021 11:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EnS1PRqnIWad9K6sQUdO8+C2d50HB1TEH3EOrTdyoTM=;
 b=ERY1OWIe3n9q9Rc58iAruumFsdKYdILEgW50K+So/xh/m76E6nDLLqm9XL3Tmy0z/3
 /JSOXzt2i4MGf1RNnN5DeNeDWMPBx5aj3Cj2SIqA4ieWVN/Q80CSerx8rAe9X1ku/BSV
 jGYjHJICnZCyzhiwNm32ia3Auwk/dCrnlQPuBtyoar5wPyOt53qoutFhGhv4fqWOkVOh
 ImADgyU2p+D9oda6EJ5WJqnoyZo7/+sYPrKDdE5J04p9mqOFRjnw+d1BhD4lGld0MBHj
 BPyXTpx1/Wa2KvKPGMWCaV764H8EEAPxKGx9JM38X14KGXO+axvRE/cs1LYdLFeoPae0
 mRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EnS1PRqnIWad9K6sQUdO8+C2d50HB1TEH3EOrTdyoTM=;
 b=bWd7F4eqAQHP3FCEK0MTUUIoZ8+6JD+cH+tylzslbttESXlt5eldb7zKTHFtvpe17w
 B1CV8FWS7yxpVxs2k8nCKcTBuiAIaH9wa5jPGp8Yz6mJyQYPjHIgNf89Q1io4zV6Rfk2
 gmCp/sU162E1RSVQWiY3OOuOsJlprafMvzmAXSWb2TLx4FkdBEpWY0qRGILcqiqdDS29
 lWuJ6xsngg+XpJD1C6/QYt2S0EIfOy2DC8AbciQWxt2YE7n6SgPVfPADFzLrTsMyJDe8
 aVq3esDVCZ+iKLxEQj2Iar4V9L1fUairzggTDFQ3EgRMjTLM20eGLyUw6lDKuMrBwVQc
 Rc2A==
X-Gm-Message-State: AOAM5334p6oYW/pGvHpmcZVGuyw6qpO7co+R/3Jv3sKeSxJnxGqRvO28
 ONhz8SsdmWnSoq26nZHQ/ro=
X-Google-Smtp-Source: ABdhPJzNKkPTb9XzQwrmn7jfOqOC4rRVXH9aYteyuwvnJ3E8xbNGnkxj8luDNnC9hlIvm3F6ggwXmA==
X-Received: by 2002:a17:902:d64a:b029:e6:30a6:64e3 with SMTP id
 y10-20020a170902d64ab02900e630a664e3mr35369843plh.28.1617129612595; 
 Tue, 30 Mar 2021 11:40:12 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id gm9sm3307696pjb.13.2021.03.30.11.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 11:40:11 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Florian Fainelli <f.fainelli@gmail.com>,
 linux-arm-kernel@lists.infradead.org, arnd@arndb.de, olof@lixom.net,
 khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/3] Broadcom devicetree changes for 5.13
Date: Tue, 30 Mar 2021 11:40:04 -0700
Message-ID: <20210330184006.1451315-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_194015_055062_3C801588 
X-CRM114-Status: UNSURE (   9.64  )
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
Message-ID: <20210330184004.9plN_GooztMe-sIGxXoOA-sBg5-nyqiQqpaTnpGC6Dk@z>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBmZTA3YmZkYTJmYjljZGVmOGE0ZDQw
MDhhNDA5YmIwMmYzNWYxYmQ4OgoKICBMaW51eCA1LjEyLXJjMSAoMjAyMS0wMi0yOCAxNjowNTox
OSAtMDgwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBodHRw
czovL2dpdGh1Yi5jb20vQnJvYWRjb20vc3RibGludXguZ2l0IHRhZ3MvYXJtLXNvYy9mb3ItNS4x
My9kZXZpY2V0cmVlCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gZGNiNTZkNjFkNWE4
YWNjYTBhMzU3Y2M2MDMzOTdiYzAyNzJjZTRjYjoKCiAgQVJNOiBkdHM6IEJDTTUzMDFYOiBTZXQg
TGlua3N5cyBFQTk1MDAgcG93ZXIgTEVEICgyMDIxLTAzLTI5IDExOjQzOjQ1IC0wNzAwKQoKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpUaGlzIHB1bGwgcmVxdWVzdCBjb250YWlucyBCcm9hZGNvbSBBUk0tYmFzZWQgU29DcyBE
ZXZpY2UgVHJlZSBjaGFuZ2VzCmZvciA1LjEzLCBwbGVhc2UgcHVsbCB0aGUgZm9sbG93aW5nOgoK
LSBSYWZhbCBmaXhlcyBZQU1MIHdhcm5pbmdzIGZvciB0aGUgbWVtb3J5IG5vZGVzIG9mIEJDTTUz
MDFYIG5vZGVzIGFuZAogIGFkZHMgc3VwcG9ydCBmb3IgdGhlIE5WTUVNIE5WUkFNIG5vZGUgb24g
TGlua3N5cyBhbmQgTHV4dWwgV0xBTgogIHJvdXRlcnMuIEhlIGFsc28gZml4ZXMgdXAgdGhlIHBh
cnRpdGlvbnMgZm9yIHRoZSBMaW5rc3lzIEVBOTQwMCB0bwogIHVzZSB0aGUgbmV3bHkgaW50cm9k
dWNlZCBwYXJzZXIgY29tcGF0aWJsZSBhbmQgc2V0cyB0aGUgcG93ZXIgTEVEIHRvCiAgaXRzIGRl
ZmF1bHQgc3RhdGUuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tClJhZmHFgiBNacWCZWNraSAoNCk6CiAgICAgIEFSTTogZHRz
OiBCQ001MzAxWDogZml4ICJyZWciIGZvcm1hdHRpbmcgaW4gL21lbW9yeSBub2RlCiAgICAgIEFS
TTogZHRzOiBCQ001MzAxWDogRGVzY3JpYmUgTlZNRU0gTlZSQU0gb24gTGlua3N5cyAmIEx1eHVs
IHJvdXRlcnMKICAgICAgQVJNOiBkdHM6IEJDTTUzMDFYOiBGaXggTGlua3N5cyBFQTk1MDAgcGFy
dGl0aW9ucwogICAgICBBUk06IGR0czogQkNNNTMwMVg6IFNldCBMaW5rc3lzIEVBOTUwMCBwb3dl
ciBMRUQKCiBhcmNoL2FybS9ib290L2R0cy9iY200NzA4LWFzdXMtcnQtYWM1NnUuZHRzICAgICAg
ICB8ICA0ICsrLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2JjbTQ3MDgtYXN1cy1ydC1hYzY4dS5kdHMg
ICAgICAgIHwgIDQgKystLQogYXJjaC9hcm0vYm9vdC9kdHMvYmNtNDcwOC1idWZmYWxvLXd6ci0x
NzUwZGhwLmR0cyAgfCAgNCArKy0tCiBhcmNoL2FybS9ib290L2R0cy9iY200NzA4LWxpbmtzeXMt
ZWE2MzAwLXYxLmR0cyAgICB8ICA1ICsrKysrCiBhcmNoL2FybS9ib290L2R0cy9iY200NzA4LW5l
dGdlYXItcjYyNTAuZHRzICAgICAgICB8ICA0ICsrLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2JjbTQ3
MDgtbmV0Z2Vhci1yNjMwMC12Mi5kdHMgICAgIHwgIDQgKystLQogYXJjaC9hcm0vYm9vdC9kdHMv
YmNtNDcwOC1zbWFydHJnLXNyNDAwYWMuZHRzICAgICAgfCAgNCArKy0tCiBhcmNoL2FybS9ib290
L2R0cy9iY200NzA4MS1hc3VzLXJ0LW4xOHUuZHRzICAgICAgICB8ICA0ICsrLS0KIGFyY2gvYXJt
L2Jvb3QvZHRzL2JjbTQ3MDgxLWJ1ZmZhbG8td3pyLTYwMGRocDIuZHRzIHwgIDQgKystLQogYXJj
aC9hcm0vYm9vdC9kdHMvYmNtNDcwODEtYnVmZmFsby13enItOTAwZGhwLmR0cyAgfCAgNCArKy0t
CiBhcmNoL2FybS9ib290L2R0cy9iY200NzA4MS1sdXh1bC14d3ItMTIwMC5kdHMgICAgICB8ICA1
ICsrKysrCiBhcmNoL2FybS9ib290L2R0cy9iY200NzA5LWFzdXMtcnQtYWM4N3UuZHRzICAgICAg
ICB8ICA0ICsrLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2JjbTQ3MDktYnVmZmFsby13eHItMTkwMGRo
cC5kdHMgIHwgIDQgKystLQogYXJjaC9hcm0vYm9vdC9kdHMvYmNtNDcwOS1saW5rc3lzLWVhOTIw
MC5kdHMgICAgICAgfCAgOSArKysrKystLQogYXJjaC9hcm0vYm9vdC9kdHMvYmNtNDcwOS1uZXRn
ZWFyLXI3MDAwLmR0cyAgICAgICAgfCAgNCArKy0tCiBhcmNoL2FybS9ib290L2R0cy9iY200NzA5
LW5ldGdlYXItcjgwMDAuZHRzICAgICAgICB8ICA0ICsrLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2Jj
bTQ3MDk0LWRsaW5rLWRpci04ODVsLmR0cyAgICAgIHwgIDQgKystLQogYXJjaC9hcm0vYm9vdC9k
dHMvYmNtNDcwOTQtbGlua3N5cy1wYW5hbWVyYS5kdHMgICAgfCAyNiArKysrKysrKysrKysrLS0t
LS0tLS0tCiBhcmNoL2FybS9ib290L2R0cy9iY200NzA5NC1sdXh1bC1hYnItNDUwMC5kdHMgICAg
ICB8ICA5ICsrKysrKy0tCiBhcmNoL2FybS9ib290L2R0cy9iY200NzA5NC1sdXh1bC14YnItNDUw
MC5kdHMgICAgICB8ICA5ICsrKysrKy0tCiBhcmNoL2FybS9ib290L2R0cy9iY200NzA5NC1sdXh1
bC14d2MtMjAwMC5kdHMgICAgICB8ICA0ICsrLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2JjbTQ3MDk0
LWx1eHVsLXh3ci0zMTAwLmR0cyAgICAgIHwgIDkgKysrKysrLS0KIGFyY2gvYXJtL2Jvb3QvZHRz
L2JjbTQ3MDk0LWx1eHVsLXh3ci0zMTUwLXYxLmR0cyAgIHwgIDkgKysrKysrLS0KIGFyY2gvYXJt
L2Jvb3QvZHRzL2JjbTQ3MDk0LW5ldGdlYXItcjg1MDAuZHRzICAgICAgIHwgIDQgKystLQogYXJj
aC9hcm0vYm9vdC9kdHMvYmNtNDcwOTQtcGhpY29tbS1rMy5kdHMgICAgICAgICAgfCAgNCArKy0t
CiAyNSBmaWxlcyBjaGFuZ2VkLCA5NCBpbnNlcnRpb25zKCspLCA1NSBkZWxldGlvbnMoLSkKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1r
ZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJu
ZWwK
